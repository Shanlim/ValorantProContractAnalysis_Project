-- Initial review of database
SELECT *
FROM ValProData


-- Making backup table
-- SELECT *
-- INTO ValProData_backup
-- FROM ValProData

--------------------------------------------------------------------------

-- Data Cleaning:

-- 1. Delete unnecessary columns (R, Agents)
ALTER TABLE ValProData
DROP COLUMN Agents, R


-- 2. Trim values 
UPDATE ValProData
SET	Player = LTRIM(RTRIM(Player)),
	Rnd = LTRIM(RTRIM(Rnd)),
	ACS = LTRIM(RTRIM(ACS)),
    [K:D] = LTRIM(RTRIM([K:D])),
    KAST = LTRIM(RTRIM(KAST)),
    ADR = LTRIM(RTRIM(ADR)),
    KPR = LTRIM(RTRIM(KPR)),
    APR = LTRIM(RTRIM(APR)),
    FKPR = LTRIM(RTRIM(FKPR)),
    FDPR = LTRIM(RTRIM(FDPR)),
    [HS%] = LTRIM(RTRIM([HS%])),
    [CL%] = LTRIM(RTRIM([CL%])),
	CL = LTRIM(RTRIM(CL)),
	KMax = LTRIM(RTRIM(KMax)),
	K = LTRIM(RTRIM(K)),
	D = LTRIM(RTRIM(D)),
	A = LTRIM(RTRIM(A)),
	FK = LTRIM(RTRIM(FK)),
	FD = LTRIM(RTRIM(FD));


-- 3. Adjust datatypes of columns that require it

-- Rename columns to remove special characters
EXEC sp_rename 'ValProData.KAST', 'KAST_percentage', 'COLUMN';
EXEC sp_rename 'ValProData.[HS%]', 'HS_percentage', 'COLUMN';
EXEC sp_rename 'ValProData.[CL%]', 'CL_percentage', 'COLUMN';


-- Remove '%' signs
UPDATE ValProData
SET 
	KAST_percentage = REPLACE(KAST_percentage, '%', ''),
	HS_percentage = REPLACE(HS_percentage, '%', ''),
	CL_percentage = REPLACE(CL_percentage, '%', '');


-- Convert values to decimals
UPDATE ValProData
SET
	KAST_percentage = CAST(KAST_percentage AS FLOAT) / 100,
	HS_percentage = CAST(HS_percentage AS FLOAT) / 100,
	CL_percentage = CAST(CL_percentage AS FLOAT) / 100;


-- Change column data types
ALTER TABLE ValProData
ALTER COLUMN Player NVARCHAR(255);

ALTER TABLE ValProData
ALTER COLUMN Rnd INT;

ALTER TABLE ValProData
ALTER COLUMN ACS FLOAT;

ALTER TABLE ValProData
ALTER COLUMN [K:D] FLOAT;

ALTER TABLE ValProData
ALTER COLUMN KAST_percentage FLOAT;

ALTER TABLE ValProData
ALTER COLUMN ADR FLOAT;

ALTER TABLE ValProData
ALTER COLUMN KPR FLOAT;

ALTER TABLE ValProData
ALTER COLUMN APR FLOAT;

ALTER TABLE ValProData
ALTER COLUMN FKPR FLOAT;

ALTER TABLE ValProData
ALTER COLUMN FDPR FLOAT;

ALTER TABLE ValProData
ALTER COLUMN HS_percentage FLOAT;

ALTER TABLE ValProData
ALTER COLUMN CL_percentage FLOAT;

ALTER TABLE ValProData
ALTER COLUMN CL NVARCHAR(10);

ALTER TABLE ValProData
ALTER COLUMN KMax INT;

ALTER TABLE ValProData
ALTER COLUMN K INT;

ALTER TABLE ValProData
ALTER COLUMN D INT;

ALTER TABLE ValProData
ALTER COLUMN A INT;

ALTER TABLE ValProData
ALTER COLUMN FK INT;

ALTER TABLE ValProData
ALTER COLUMN FD INT;


-- 4. Split Player column into PlayerName and Team columns
ALTER TABLE ValProData
ADD 
	PlayerName NVARCHAR(255),
	Team NVARCHAR(255);


/*
I ran into issues here because I couldn't use substring function on Player column
because the ' ' between player name and team (EX.Demon1 EG) was not actually a space
*/

-- Identify the character causing issues (line break)
SELECT DISTINCT 
    Player,
    UNICODE(SUBSTRING(Player, 1, 1)) AS CharCode1,
    UNICODE(SUBSTRING(Player, 2, 1)) AS CharCode2,
    UNICODE(SUBSTRING(Player, 3, 1)) AS CharCode3,
    UNICODE(SUBSTRING(Player, 4, 1)) AS CharCode4,
    UNICODE(SUBSTRING(Player, 5, 1)) AS CharCode5,
    UNICODE(SUBSTRING(Player, 6, 1)) AS CharCode6,
    UNICODE(SUBSTRING(Player, 7, 1)) AS CharCode7,
    UNICODE(SUBSTRING(Player, 8, 1)) AS CharCode8,
    UNICODE(SUBSTRING(Player, 9, 1)) AS CharCode9,
    UNICODE(SUBSTRING(Player, 10, 1)) AS CharCode10
FROM ValProData;
-- The "space" is unicode 10 = line break


-- Replace line break with a ' ' 
UPDATE ValProData
SET Player = REPLACE(Player, CHAR(10), ' ');


-- Populate new columns (PlayerName, Team)
UPDATE ValProData
SET PlayerName = LTRIM(RTRIM(SUBSTRING(Player, 1, CHARINDEX(' ', Player) - 1))),
    Team = LTRIM(RTRIM(SUBSTRING(Player, CHARINDEX(' ', Player) + 1, LEN(Player) - CHARINDEX(' ', Player))))
WHERE CHARINDEX(' ', Player) > 0;


-- Remove Player column
ALTER TABLE ValProData
DROP COLUMN Player;


-- 5. Populate NULL Clutch Percentage values

-- Update the CL_percentage for 0/ cases using a wildcard
UPDATE ValProData
SET CL_percentage = 0
WHERE CL LIKE '0/%' AND CL_percentage IS NULL;


-- Verify
SELECT CL, CL_percentage
FROM ValProData
WHERE CL LIKE '0/%';

--6. Create Valuable Player Rating (VPR)

-- Add a new column for FKFD
ALTER TABLE ValProData
ADD FKFD FLOAT;

-- Update FKFD values
UPDATE ValProData
SET FKFD = ROUND(FKPR / FDPR, 3);


-- Add VPR column

ALTER TABLE ValProData
ADD VPR FLOAT;

-- Calculate VPR for each Player

UPDATE ValProData
SET VPR = ROUND((KPR * 0.8) + (APR * 0.4) + (CL_percentage * 0.25) + (FKFD * 0.2) + (KAST_percentage * 0.4), 3);

-- Verify 
SELECT PlayerName, Team, VPR
FROM ValProData
ORDER BY VPR DESC;


-- 7. Add DominantRole and Region to ValProData

-- Drop the existing PlayerDominantRoles table if it exists
DROP TABLE IF EXISTS PlayerDominantRoles;

-- Create PlayerDominantRoles table using CTE
WITH PlayerRoles AS (
    SELECT ap.PlayerName, 
           ar.Role,
           COUNT(ar.Role) AS RoleCount,
           ROW_NUMBER() OVER (PARTITION BY ap.PlayerName ORDER BY COUNT(ar.Role) DESC) AS RoleRank
    FROM AgentsPlayed ap
    JOIN AgentRoles ar ON ar.Agent IN (ap.Agent1, ap.Agent2, ap.Agent3)
    GROUP BY ap.PlayerName, ar.Role
)
SELECT PlayerName, Role AS DominantRole
INTO PlayerDominantRoles
FROM PlayerRoles
WHERE RoleRank = 1
ORDER BY PlayerName ASC;

-- Add DominantRole and Region columns to ValProData
ALTER TABLE ValProData
ADD DominantRole NVARCHAR(255),
    Region NVARCHAR(255);

-- Update ValProData with DominantRole from PlayerDominantRoles
UPDATE ValProData
SET DominantRole = pdr.DominantRole
FROM ValProData vpd
LEFT JOIN PlayerDominantRoles pdr ON vpd.PlayerName = pdr.PlayerName;

-- Update ValProData with Region from TeamRegion
UPDATE ValProData
SET Region = tr.Region
FROM ValProData vpd
LEFT JOIN TeamRegion tr ON vpd.Team = tr.Team;

-- Verify the final update
SELECT * 
FROM ValProData;



--------------------------------------------------------------------------

/*
COLUMNS:

PlayerName - Player Name
Team - Team player plays for
Rnd - # of rounds played 
ACS - Average Combat Score
K:D - Kill/Death Ratio
KAST_percentage - Kills, Assists, Survived, and Traded % (Percentage of rounds where one of these occured)
ADR - Average Damage Per Round
KPR - Kills Per Round
APR - Assists Per Round
FKPR - First Kills Per Round
FDPR - First Deaths Per Round
HS_percentage - Headshot %
CL_percentage - Clutch Success %
CL - Clutches (Won/Played)
KMax - Maximum Kills in a single map
K - Overall Kills
D - Overall Deaths
A - Overall Assists
FK - Overall First Kills
FD - Overall First deaths
VPR - Player Value Rating
DominantRole - The dominant role the player plays dependent on roles of agents
Region - Region of the team
*/


--------------------------------------------------------------------------

DROP TABLE IF EXISTS AgentPlayCount;

-- Create a CTE to count the occurrences of each agent
WITH AgentCounts AS (
    SELECT Agent, COUNT(*) AS PlayCount
    FROM (
        SELECT Agent1 AS Agent FROM AgentsPlayed
        UNION ALL
        SELECT Agent2 FROM AgentsPlayed
        UNION ALL
        SELECT Agent3 FROM AgentsPlayed
    ) AS AllAgents
    WHERE Agent IS NOT NULL
    GROUP BY Agent
)
-- Select from the CTE to create a new table
SELECT Agent, PlayCount
INTO AgentPlayCount
FROM AgentCounts
ORDER BY PlayCount DESC;


SELECT *
FROM AgentPlayCount







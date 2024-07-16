# Valorant Champions 2023 Tournament Player Value Analysis

## Introduction
Analyzing player metric trends based on player performance during the Valorant Champions Tournament 2023 to make informed recommendations on player contract acquisition based on a player value rating.

An Interactive PowerBI dashboard can be found [here](https://ucsdcloud-my.sharepoint.com/:u:/g/personal/shl120_ucsd_edu/EfcTBjjniRZKg3CukQeZnQoBDGNTdzu2gndn51dSTwI3WA?e=dpx1o3).
![Tournament Analysis](https://github.com/Shanlim/Valorant-Pro-Analysis/blob/main/DashboardImages/Tournament%20Analysis.png)


## How the Value Player Rating (VPR) was constructed

**VPR = (KPR * 0.8) + (APR * 0.5) + (Clutch % * 0.25) + (FKFD * 0.2) + (KAST % * 0.4)**

### Metrics Explained

1. **KPR**: Average Kills Per Round
   
2. **APR**: Average Assist Per Round
  
3. **Clutch %**: Clutch Rate Percentage (Won/Played)
   - **Importance**: Measures a player's ability to perform in high-pressure situations, and is representative of a players reliability in the clutch.
   
4. **FKFD**: First Kill First Death Ratio
   - **Importance**: Measures how often a player gets the first kill versus being the first to die in a given round. A high FKFD ratio shows that a player consistently contributes to gaining an early numbers advantage for their team in a given round.
   
5. **KAST %**: Impact Percentage (Kills, Assists, Survived, and Traded Percentage)
   - **Importance**: Measures the percentage of rounds in which a player either got a kill, assist, survived, or was traded. A high KAST % indicates a player's consistency in bringing value to their team in every round.



## Summary of Insights

### Tournament Insights:

- **Player Role Distribution**: **Controllers** dominated the tournament, being the most represented role. This indicates their crucial role in controlling the tempo of the game.
- **Meta Trends**: The meta revolved around **Killjoy** and **Controller** agents, which were pivotal in holding sites and providing team support. Mobility-based agents like **Jett** and **Raze** were frequently picked to counteract this meta, providing aggressive plays and opening opportunities for their teams.
- **Killjoy Dominance**: Despite **Sentinels** being the least represented role, **Killjoy** was the most picked agent, proving her value in the tournament and her effectiveness in an underrepresented role.

### VPR on Role:
![VPR by Role](https://github.com/Shanlim/Valorant-Pro-Analysis/blob/main/DashboardImages/VPR%20by%20Role.png)

- **Top Performers by Role**: **Duelists** had the highest average VPRs across all roles, showcasing their impactful presence in matches through high kill counts and above-average FKFD scores. Players like **kez1nit** and **aspas** were standout Duelists. **Initiators** also showed strong VPRs, showing a greater emphasis on both assists and KAST %, emphasizing their role in creating value through making opportunities and supporting their team, with players like **Leo** and **Cloud** leading the way.

- **Role-Specific Insights**: **Sentinels**, while the least represented role, had players like **Demon1** and **SUYGETSU** with tournament-high VPRs, indicating standout performances that are critical despite the overall lower representation of the role.

### VPR on Region:
![VPR by Region](https://github.com/Shanlim/Valorant-Pro-Analysis/blob/main/DashboardImages/VPR%20by%20Region.png)

- **Regional Strengths**: Players from regions with well-developed and tenured esports organizations like **Europe** and **North America** generally had higher VPRs, indicating a higher level of competition and individual performance in these regions. Players like **Demon1** from North America and **Leo** from Europe exemplify this trend.

- **Regional Weaknesses**: Certain regions like **China** showed lower overall VPRs, suggesting a potential gap in competitive experience or performance. While regions with less developed esports scenes, like **Brazil** and **Latin America South**, were represented by only one team.


## Recommendations and Next Steps

- Investigate player match histories of players with high VPRs but low # of rounds played to see if these players have been consistently valuable. (Three of the tournament's top six players played less than 200 rounds)

- Consider the leverage of the offering Esports organization. Organizations can import players at lower contract offers from regions with underdeveloped esports scenes, such as Brazil. It is common for North American or European organizations to import players (scout emerging talent from different regions).

- Look at offering contracts to undervalued players, or players that might thrive within a different role based on their performance and the necessity for filling in a position.


## Player Contract/Talent Acquisition Recommendations

### Ardiis (NRG) 
![Ardiis](https://github.com/Shanlim/Valorant-Pro-Analysis/blob/main/PlayerImages/Ardiis.png)

- **Overall Performance**:
   - **Top 4 in Value Player Rating (VPR) for Sentinels** with the highest First Kill Per Round (FKPR) score among Sentinals, including **Demon1** (another Sentinal player who had the highest VPR score in the entire tournament).
   - Ranked top 20 in VPR overall and top 5 in FKPR overall.

- **Undervaluation**:
   - Despite his high FKPR, Ardiis appears undervalued in VPR overall due to his 0/9 clutch performance and a moderate First Death Per Round (FDPR) score, masking his high FKPR impact.

- **Role Flexibility**:
   - High FKPR suggests potential in a Duelist role, which could improve his First Kill First Death Ratio (FKFD) by reducing FDPR.
   - The Duelist role would also provide him with better tools to perform in the clutch.

- **Team Performance**:
   - Ardiis's team, **NRG**, did not advance past the group stage, possibly prompting the organization to consider roster changes for the upcoming season. 

- **Contract Status**:
   - Ardiis's contract is set to end in 2024, which is earlier than NRG's franchise players, whose contracts extend to 2025. This presents a timely opportunity for other organizations to acquire a high-potential player.


### Less (LOUD)
![Less](https://github.com/Shanlim/Valorant-Pro-Analysis/blob/main/PlayerImages/Less.png)

- **Overall Performance**:
  - **Top 2 in VPR for Controllers** with the highest Kills Per Round (KPR) score among controllers.
  - **12th place in overall tournament VPR** and **11th in overall tournament KPR**, with the next highest controller's KPR ranking 16th.

- **Value**:
   - High KPR for his role indicates his consistency in confirming trades and securing kills while playing in a role not typically focused on kills, showing his efficiency as a prospective player.
   - Second highest FKFD ratio in the controller category.
   - Similar KPR and APR to his teammate **aspas**, a duelist and the third overall most valuable player in the tournament by VPR.

- **Contract Status**:
   - Contract with **LOUD** ends in 2023, presenting a prime opportunity for other organizations to offer him a contract.

- **Region Weakness**:
   - **Brazil** is an underrepresented region in esports, with only LOUD representing the country in the tournament.
   - Players from weaker regions are encouraged to seek contracts in regions with stronger esports presence like **North America** or **Europe** for better opportunities and growth.

### Keznit (KRÜ)
![Keznit](https://github.com/Shanlim/Valorant-Pro-Analysis/blob/main/PlayerImages/Keznit.png)

- Did not make it far into the tournament, but in the less than 100 rounds which is played which is almost less than everyone else, he came out as the number 1 scorer VPR in the entire tournament, make sure to look at his previous games to see if he is consistenct


### C0m (EG)
![C0m](https://github.com/Shanlim/Valorant-Pro-Analysis/blob/main/PlayerImages/COM.png)




- second best clutch rate, but the most clutches played, meaning the player is extrememly valuable underpressue

VPR ON ROLE
- **Contract Considerations**: When considering contracts, prioritize high VPR players from roles that consistently impact the game, like **Duelists** and **Initiators**, while also recognizing exceptional performances from underrepresented roles like **Sentinels**.

- **Regional Contract Recommendations**: Focus on acquiring top-performing players from strong regions to ensure high-impact signings. Additionally, consider scouting emerging talents from regions with lower VPRs but high potential for growth.

   










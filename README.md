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


## Considerations and Next Steps

- 



## Player Contract/Talent Acquisition Recommendations



VPR ON ROLE
- **Contract Considerations**: When considering contracts, prioritize high VPR players from roles that consistently impact the game, like **Duelists** and **Initiators**, while also recognizing exceptional performances from underrepresented roles like **Sentinels**.

- **Regional Contract Recommendations**: Focus on acquiring top-performing players from strong regions to ensure high-impact signings. Additionally, consider scouting emerging talents from regions with lower VPRs but high potential for growth.


## Questions to Answer
1. [**Who were the most valuable players of the tournament?**](#who-were-the-most-valuable-players-of-the-tournament)
2. [**What were the performance metrics of the most valuable players?**](#what-were-the-performance-metrics-of-the-most-valuable-players)
4. [**Who were the most undervalued players of the tournament?**](#who-were-the-most-undervalued-players-of-the-tournament)
5. [**Which regions have the most potential future contract prospects?**](#which-regions-have-the-most-potential-future-contract-prospects)
6. [**Which players can be recommended as contract prospects?**](#which-players-can-be-recommended-as-contract-prospects)

   










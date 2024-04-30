/* Query 1: Count the total number of games in the dataset. */

SELECT 
     COUNT(*)
FROM game_sales


/*Query 2:  List all games released in the year 2020 */

SELECT DISTINCT  "Name"
FROM game_sales
WHERE "Year" = 2020;

/* Query 3 :Easy: Calculate the average critic score for all games */
SELECT ROUND(AVG("Critic_Score")::numeric, 2) AS avg_critic_score
FROM game_sales;

/*Question 4: List all games with a user score greater than 8. */
SELECT 
      DISTINCT "Name"
FROM game_sales
WHERE "User_Score" > 8


/* Question 5: Moderate: Find the top 5 games by total shipped units. */
SELECT 
     "Name"
FROM game_sales
ORDER BY "Total_Shipped" DESC
LIMIT 5

/*Question 6: Moderate: Calculate the average critic score for games on each platform.
*/
SELECT "Platform", ROUND(AVG("Critic_Score")::numeric, 2) AS avg_critic_score
FROM game_sales
WHERE "Critic_Score" IS NOT NULL
GROUP BY "Platform"
ORDER BY 2 DESC;
      
/* Question 7: List games released by Nintendo sorted by year in DESC order*/
SELECT 
      "Year",
      "Name"
FROM game_sales
WHERE "Developer" = 'Nintendo EAD'
ORDER BY "Year";

/*Question 8: Count the number of games released by each publisher. Sort the number of games in descending order */
SELECT 
     "Publisher",
	 COUNT(*) as number_of_games_released
FROM game_sales
GROUP BY "Publisher"
ORDER BY 2 DESC;

/*Question 9 Calculate the total units shipped by each publisher.*/
SELECT 
      "Publisher",
	  SUM("Total_Shipped")
FROM game_sales
GROUP BY "Publisher"

/* Question 10:  List all platforms and the highest scoring game on each. */
WITH RankedGames AS (
    SELECT
        "Name",
        "Platform",
        "Critic_Score",
        ROW_NUMBER() OVER (
            PARTITION BY "Platform"
            ORDER BY "Critic_Score" DESC
        ) AS rank
    FROM game_sales
    WHERE "Critic_Score" IS NOT NULL
)

SELECT "Name", "Platform", "Critic_Score"
FROM RankedGames
WHERE rank = 1;

/*Question 11: Rank games within each platform by total units shipped.*/
SELECT
    *,
    RANK() OVER (
        PARTITION BY "Platform"
        ORDER BY "Total_Shipped" DESC
    ) AS shipment_rank
FROM game_sales;


/*Question 12: Find the year with the highest average critic score.*/
WITH average_criticscore AS (
    SELECT 
        "Year",
        AVG("Critic_Score") AS avg_critic_score
    FROM game_sales
    WHERE "Critic_Score" IS NOT NULL
    GROUP BY "Year"
),
ranking_average AS (
    SELECT 
        *,
        RANK() OVER (ORDER BY avg_critic_score DESC) AS rnk
    FROM average_criticscore
)
SELECT
    "Year"
FROM ranking_average 
WHERE rnk = 1;
/* Question 13: Calculate the difference in critic score and user score for each game. */
SELECT
    "Name",
    ROUND(("Critic_Score" - "User_Score")::numeric, 2) AS diff
FROM game_sales;

/*Question 14: Calculate a cumulative total of games shipped over the years. */
SELECT 
    "Year",
    "Total_Shipped",
    ROUND(SUM("Total_Shipped") OVER (ORDER BY "Year")::numeric, 2) AS cumulative_total
FROM game_sales
ORDER BY "Year";

/*Question 15: Complex with Window Function: Rank developers by their games' average critic scores within each platform */
WITH DeveloperScores AS (
    SELECT 
        "Developer",
        "Platform",
        AVG("Critic_Score") AS avg_critic_score
    FROM game_sales
    WHERE "Critic_Score" IS NOT NULL
    GROUP BY "Developer", "Platform"
)
SELECT
    "Developer",
    "Platform",
    avg_critic_score,
    RANK() OVER (
        PARTITION BY "Platform"
        ORDER BY avg_critic_score DESC
    ) AS developer_rank
FROM DeveloperScores
ORDER BY "Platform", developer_rank;


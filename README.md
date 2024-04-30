# Video Game Sales Data Analysis

This repository contains scripts and data for analyzing video game sales using SQL and Python. It's designed to facilitate the importation and analysis of video game sales data, exploring trends and insights using PostgreSQL.

## Project Structure

- **data/**: Contains CSV files with the video game sales data.
- **sql-queries-videogames.sql**: SQL queries for analyzing video game sales data.
- **transfering_video_games_data_to_sql.ipynb**: A Jupyter notebook that demonstrates how to import video game sales data into a SQL database.
- **README.md**: This file, providing an overview of the project and instructions for setup and analysis.

## Getting Started

### Prerequisites

Before running the scripts, make sure you have the following installed:
- Python 3.8 or higher
- PostgreSQL
- Jupyter Notebook

### Installation

1. Clone the repository:

### Running the Notebook

To run the Jupyter notebook and start analyzing the video game sales data, execute the following command in the project directory:


## Usage

To perform the data analysis:
1. Start your PostgreSQL server.
2. Modify the database credentials in `transfering_video_games_data_to_sql.ipynb` to connect to your PostgreSQL instance.
3. Run the SQL queries provided in `sql-queries-videogames.sql` to analyze the data.

## Queries:
'''

| Query No. | Description                                                           | SQL Query Summary                                                                                               |
|-----------|-----------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------|
| 1         | Count all entries in the game sales database                          | Counts all records in the `game_sales` table.                                                                  |
| 2         | List all games released in the year 2020                              | Selects distinct game names from `game_sales` where the year is 2020.                                          |
| 3         | Calculate the average critic score for all games                      | Calculates the average critic score for all games in `game_sales`, rounded to two decimal places.              |
| 4         | List all games with a user score greater than 8                       | Selects distinct game names where the user score is greater than 8.                                            |
| 5         | Find the top 5 games by total shipped units                           | Lists the top 5 games ordered by total shipped units in descending order.                                      |
| 6         | Calculate the average critic score for games on each platform         | Groups games by platform and calculates the average critic score, ordered by score in descending order.        |
| 7         | List games released by Nintendo, sorted by year in descending order   | Selects game names and years for games developed by Nintendo EAD, ordered by year descending.                  |
| 8         | Count the number of games released by each publisher                  | Counts games grouped by publisher, ordered by count in descending order.                                       |
| 9         | Calculate the total units shipped by each publisher                   | Sums total units shipped grouped by publisher.                                                                 |
| 10        | List all platforms and the highest scoring game on each               | Uses a window function to rank games by critic score within each platform and selects the top-ranked game.     |
| 11        | Rank games within each platform by total units shipped                | Applies a ranking window function to games within each platform based on total shipped units.                  |
| 12        | Find the year with the highest average critic score                   | Uses a window function to find the year with the highest average critic score across all games.                |
| 13        | Calculate the difference in critic score and user score for each game | Calculates the difference between critic and user scores for each game, rounded to two decimal places.         |
| 14        | Calculate a cumulative total of games shipped over the years          | Computes a cumulative sum of total shipped units over the years, ordered by year.                              |
| 15        | Rank developers by their games' average critic scores within platforms| Ranks developers within each platform based on the average critic score of their games, using a window function.|

This table provides a clear reference for understanding what each SQL query in the project does, aiding in both documentation and further development of the project.
'''



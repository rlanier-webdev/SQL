CREATE DATABASE WNBADraftDB;
GO

USE WNBADraftDB;
GO

-- Create Picks Table
CREATE TABLE Picks (
    id INT NOT NULL PRIMARY KEY,
    overall_pick INT NOT NULL,
    year INT NOT NULL,
    team VARCHAR(24) NOT NULL,
    player VARCHAR(25),
    former VARCHAR(39),
    college VARCHAR(38),
    years_played INT NOT NULL,
    games INT,
    win_shares DECIMAL(4, 1),
    win_shares_40 DECIMAL(6, 3),
    minutes_played DECIMAL(6, 1),
    points DECIMAL(6, 1),
    total_rebounds DECIMAL(5, 1),
    assists DECIMAL(5, 1)
);

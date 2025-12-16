-- Connect to stock_analysis database first!

CREATE DATABASE stock_analysis;

DROP TABLE IF EXISTS top10_volatile_stocks;
CREATE TABLE top10_volatile_stocks (
    Ticker VARCHAR(50),
    Volatility NUMERIC
);

DROP TABLE IF EXISTS top5_cumulative_return;
CREATE TABLE top5_cumulative_return (
    Ticker VARCHAR(50),
    cum_return NUMERIC
);

DROP TABLE IF EXISTS top5_gainers_losers_allmonths;
CREATE TABLE top5_gainers_losers_allmonths (
    Ticker VARCHAR(50),
    Return NUMERIC,
    Type VARCHAR(50),
    month VARCHAR(20)
);

DROP TABLE IF EXISTS stock_correlation_matrix;
CREATE TABLE stock_correlation_matrix (
    Stock1 VARCHAR(50),
    Stock2 VARCHAR(50),
    Correlation NUMERIC
);

DROP TABLE IF EXISTS sector_performance;
CREATE TABLE sector_performance (
    Sector VARCHAR(50),
    Average_Yearly_Return VARCHAR(100)
);


COPY top10_volatile_stocks
FROM 'E:/python project/project2/top10_volatile_stocks.csv'
DELIMITER ','
CSV HEADER;

COPY top5_cumulative_return
FROM 'E:/python project/project2/top5_cumulative_return.csv'
DELIMITER ','
CSV HEADER;

COPY top5_gainers_losers_allmonths(Ticker, Return, Type, month)
FROM 'E:/python project/project2/Top5_Gainers_Losers_AllMonths.csv'
DELIMITER ','
CSV HEADER;

COPY stock_correlation_matrix
FROM 'E:/python project/project2/Stock_Correlation_Matrix.csv'
DELIMITER ','
CSV HEADER;

COPY sector_performance
FROM 'E:/python project/project2/Sector_Performance.csv'
DELIMITER ','
CSV HEADER;

UPDATE top5_gainers_losers_allmonths
SET type = 'Top loser'
WHERE LOWER(type) LIKE '%losser%';

SELECT * FROM top10_volatile_stocks LIMIT 10;
SELECT * FROM top5_cumulative_return LIMIT 5;
SELECT * FROM top5_gainers_losers_allmonths LIMIT 140;
SELECT * FROM stock_correlation_matrix LIMIT 5;
SELECT * FROM sector_performance LIMIT 20;

DROP TABLE IF EXISTS top10_green_stocks;

CREATE TABLE top10_green_stocks (
    Ticker VARCHAR(50),
    yearly_return NUMERIC
);

DROP TABLE IF EXISTS top10_loss_stocks;

CREATE TABLE top10_loss_stocks (
    Ticker VARCHAR(50),
    yearly_return NUMERIC
);

DROP TABLE IF EXISTS market_summary;

CREATE TABLE market_summary (
    metric VARCHAR(100),
    value NUMERIC
);


COPY top10_green_stocks 
FROM 'E:\python project\project2\top10_green_stocks.csv'
DELIMITER ','
CSV HEADER;


COPY top10_loss_stocks 
FROM 'E:\python project\project2\top10_loss_stocks.csv'
DELIMITER ','
CSV HEADER;


COPY market_summary ( metric, value)
FROM 'E:\python project\project2\market_summary.csv'
DELIMITER ','
CSV HEADER;


SELECT * FROM top10_green_stocks
LIMIT 10;
 
SELECT * FROM top10_loss_stocks
LIMIT 10;

SELECT * FROM market_summary
LIMIT 20;

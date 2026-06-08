CREATE DATABASE company_layoffs;
USE company_layoffs;
SELECT *
FROM layoffs;
#----------------------------------------------------------

# Create duplicate layoff table for formatting
CREATE TABLE dup_layoffs
LIKE layoffs; 
SELECT *
FROM dup_layoffs;
--
INSERT INTO dup_layoffs
SELECT *
FROM layoffs;
#----------------------------------------------------------------

# Check for duplicates rows
# add unique row_number to each rows
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, date, stage, country, funds_raised_millions) AS row_num
FROM dup_layoffs;
-- #
# Search for rows which row_num > 1
WITH cte_layoffs AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, date, stage, country, funds_raised_millions) AS row_num
FROM dup_layoffs
)
SELECT *
FROM cte_layoffs
WHERE row_num > 1;

# Created another table that will include an extra table "row_num"  for me to be able to delete
CREATE TABLE `dup_layoffs2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

# Inset into the table
INSERT INTO dup_layoffs2
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, date, stage, country, funds_raised_millions) AS row_num
FROM dup_layoffs;

DELETE
FROM dup_layoffs2
WHERE row_num > 1; # done with duplicate rows

#----------------------------------------------------------------------------

# Now, Let trim all coulmn
UPDATE dup_layoffs2
SET 
company = TRIM(company),
location = TRIM(location),
industry = TRIM(industry), 
total_laid_off = TRIM(total_laid_off), 
percentage_laid_off = TRIM(percentage_laid_off), 
`date` = TRIM(`date`), 
stage = TRIM(stage), 
country = TRIM(country), 
funds_raised_millions = TRIM(funds_raised_millions), 
row_num = TRIM(row_num);

SELECT *
FROM dup_layoffs2;
#----

# checking for errors

SELECT *
FROM dup_layoffs2;

SELECT *
FROM dup_layoffs2
WHERE industry like "crypto%";

UPDATE dup_layoffs2
SET industry = "Crypto"
WHERE industry like "Crypto%";

# date
UPDATE dup_layoffs2
SET `date` = STR_TO_DATE(`date`, "%m/%d/%Y");

ALTER TABLE dup_layoffs2
MODIFY `date` DATE;

#------------ country
# need update
UPDATE dup_layoffs2
SET country = "United States"
WHERE country LIKE "United State%";
#----------------------------------------



# check for null and " "
SELECT *
FROM dup_layoffs2;
-- #
# Deleted WHERE total_laid_off IS NULL AND percentage_laid_off IS NULL;
DELETE
FROM dup_layoffs2
WHERE total_laid_off IS NULL AND percentage_laid_off IS NULL;

SELECT *
FROM dup_layoffs2
WHERE total_laid_off IS NULL AND percentage_laid_off IS NULL;
#------;

# Since percentage_laid_off is known, SET total_laid_off = (percentage_laid_off * 100)
# WHERE total_laid_off IS NULL
UPDATE dup_layoffs2
SET total_laid_off = (percentage_laid_off * 100)
WHERE total_laid_off IS NULL;

SELECT *
FROM dup_layoffs2
WHERE total_laid_off IS NULL;
#--------------
# Since percentage_laid_off is known, SET total_laid_off = (percentage_laid_off * 100)
# WHERE total_laid_off IS NULL
UPDATE dup_layoffs2
SET percentage_laid_off = (total_laid_off / 100)
WHERE percentage_laid_off IS NULL;

SELECT *
FROM dup_layoffs2
WHERE percentage_laid_off IS NULL;

#----------------------------------------------------------------------------end

# Deleting row not needed anymore
ALTER TABLE dup_layoffs2
DROP COLUMN row_num;

SELECT *
FROM dup_layoffs2;

SELECT company, country, stage OVER()
FROM dup_layoffs2;


















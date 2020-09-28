
DROP TABLE georgia_death_rates;
CREATE TABLE georgia_death_rates(
county_names VARCHAR(20) PRIMARY KEY,
death_rates decimal(10,6));

ALTER TABLE georgia_death_rates
MODIFY COLUMN death_rates decimal(10,2);

DROP TABLE social_environment;
CREATE TABLE social_environment(
county_names VARCHAR(20),
median_household_income INT,
poverty_percentage DECIMAL(10,4));

ALTER TABLE social_environment
MODIFY poverty_percentage decimal(10,2);

ALTER TABLE social_environment
ADD FOREIGN KEY(county_names)
REFERENCES georgia_death_rates(county_names)
ON DELETE SET NULL;

DROP TABLE physical_environment;
CREATE TABLE physical_environment(
county_names VARCHAR(20),
air_quality DECIMAL(6,3),
park_in_half_mile INT);

ALTER TABLE physical_environment
ADD FOREIGN KEY(county_names)
REFERENCES georgia_death_rates(county_names)
ON DELETE SET NULL;

DROP TABLE health_risk;
CREATE TABLE health_risk(
county_names VARCHAR(20),
physical_inactivity DECIMAL(3,1),
obeisity DECIMAL(3,1),
diabetes DECIMAL(3,1));

ALTER TABLE health_risk
ADD FOREIGN KEY(county_names)
REFERENCES georgia_death_rates(county_names)
ON DELETE SET NULL;

SELECT * FROM social_environment;
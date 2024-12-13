DROP TABLE IF EXISTS stratchart.ranks CASCADE;
CREATE TABLE stratchart.ranks (
    rank_id SERIAL PRIMARY KEY,
	rank_name VARCHAR(25)
);

DROP TABLE IF EXISTS stratchart.data_sources CASCADE;
CREATE TABLE stratchart.data_sources (
    source_id SERIAL PRIMARY KEY,
	source_name VARCHAR(255)
);

DROP TABLE IF EXISTS stratchart.strat_units CASCADE;
CREATE TABLE stratchart.strat_units (
    unit_id SERIAL PRIMARY KEY,
    parent_unit_id INT REFERENCES stratchart.strat_units(unit_id),
	unit_name VARCHAR(50),
	strat_index VARCHAR(10),
	rank_id INT REFERENCES stratchart.ranks(rank_id),
	start_age_ma NUMERIC(10, 5),
	end_age_ma NUMERIC(10, 5),
	start_age_err_ma NUMERIC(10, 5),
	font_color VARCHAR(25),
	cmyk VARCHAR(15),
	cyan INT,
	magenta INT,
	yellow INT,
	black INT,
	rgb VARCHAR(11),
	red INT,
	green INT,
	blue INT,
	html_rgb_hash VARCHAR(7),
	cource_id INT REFERENCES stratchart.data_sources(source_id),
	standard_sort INT
);

-- importing data from prepared tables
-- use one of the following paths:
--'/Volumes/GoogleDrive/My Drive/IRMC/sql/StratChart/strat_ranks.txt'
--"G:\My Drive\IRMC\sql\StratChart\strat_ranks.txt" 
COPY stratchart.ranks
FROM 'G:\My Drive\IRMC\sql\StratChart\strat_ranks.txt'
DELIMITER ','
CSV HEADER;


COPY stratchart.data_sources
FROM '/Volumes/GoogleDrive/My Drive/IRMC/sql/StratChart/strat_data_sources.txt'
DELIMITER ','
CSV HEADER;

COPY stratchart.strat_units
FROM '/Volumes/GoogleDrive/My Drive/IRMC/sql/StratChart/strat_units.txt'
DELIMITER ','
CSV HEADER;

SELECT *
FROM stratchart.data_sources
ORIGINAL FILES DESCTIRPTION

    file: CGMW_ICS_colour_codes.xlsx   --https://stratigraphy.org/chart

    file: ChronostratChart2023-09.pdf  --https://stratigraphy.org/chart

    file: chrono_indexes.png           --Strat index data (mnemonics for stratigraphic units). searched form internet
	
	
DATA PROCESSING FLOW

step 1: Processing input data

file: CGMW_ICS_colour_codes_edit.xlsx  --added columns: unit_id, parent_unit_id, strat_index, start_age_ma, end_age_ma, start_age_err_ma

file out: input_data.txt               --tab separated table

step 2: Creating tables for Postgres

file: StratChart_from_pdf.ipynb    --Retrieving data for postgres from 'input_data.txt'

file out: strat_ranks.txt          --data for table: 'ranks' in postgres

file out: start_data_soutces.txt   --data for 'sources' in postgres

file out: strat_units.txt          --data for 'units' in postgres

step 3: Creating and filling data base

file: StratChartSchema.sql         --Creating schema

file: StratChartTables.sql         --Creating tables and filling with the data.
	
step 4: checking the results

file: find_unit_example.sql        --Check the data base works.
    

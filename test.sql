-- OFFENSE
CREATE TABLE kenpom_offense (
    year INT,
    team TEXT,
    adj_off_eff NUMERIC,
    adj_off_eff_rank INT,
    efg_pct NUMERIC,
    efg_pct_rank INT,
    turnover_rate NUMERIC,
    turnover_rate_rank INT,
    offensive_rebound_rate NUMERIC,
    offensive_rebound_rate_rank INT
);

-- DEFENSE
CREATE TABLE kenpom_defense (
    year INT,
    team TEXT,
    adj_def_eff NUMERIC,
    adj_def_eff_rank INT,
    efg_def NUMERIC,
    efg_def_rank INT,
    turnover_rate_def NUMERIC,
    turnover_rate_def_rank INT
);

-- EFFICIENCY
CREATE TABLE kenpom_efficiency (
    year INT,
    team TEXT,
    adj_eff_margin NUMERIC,
    adj_eff_margin_rank INT,
    adj_off_eff NUMERIC,
    adj_def_eff NUMERIC,
    tempo NUMERIC
);

-- SUMMARY
CREATE TABLE kenpom_summary (
    year INT,
    team TEXT,
    conference TEXT,
    wins INT,
    losses INT,
    tempo NUMERIC,
    luck NUMERIC
);

-- POINT DISTRIBUTION
CREATE TABLE kenpom_point_distribution (
    year INT,
    team TEXT,
    pct_2pt NUMERIC,
    pct_3pt NUMERIC,
    pct_ft NUMERIC
);

-- MISC
CREATE TABLE kenpom_misc (
    year INT,
    team TEXT,
    experience NUMERIC,
    continuity NUMERIC,
    height NUMERIC
);

-- HEIGHT
CREATE TABLE kenpom_height (
    year INT,
    team TEXT,
    avg_height NUMERIC
);

-- MARCH MADNESS MAIN DATA
CREATE TABLE march_madness_games (
    year INT,
    team TEXT,
    opponent TEXT,
    seed INT,
    round TEXT,
    result TEXT
);

SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'public';



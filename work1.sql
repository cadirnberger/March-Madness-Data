-- =========================
-- DROP (clean reset)
-- =========================
DROP TABLE IF EXISTS kenpom_height CASCADE;
DROP TABLE IF EXISTS kenpom_misc CASCADE;
DROP TABLE IF EXISTS kenpom_point_distribution CASCADE;
DROP TABLE IF EXISTS kenpom_summary CASCADE;
DROP TABLE IF EXISTS kenpom_efficiency CASCADE;
DROP TABLE IF EXISTS kenpom_defense CASCADE;
DROP TABLE IF EXISTS kenpom_offense CASCADE;
DROP TABLE IF EXISTS team_mapping CASCADE;

-- =========================
-- CREATE TABLES
-- =========================

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
    turnover_rate_def_rank INT,
    offensive_rebound_rate_def NUMERIC,
    offensive_rebound_rate_def_rank INT
);

-- EFFICIENCY
CREATE TABLE kenpom_efficiency (
    year INT,
    team TEXT,
    conference TEXT,
    adj_eff_margin NUMERIC,
    adj_eff_margin_rank INT,
    adj_off_eff NUMERIC,
    adj_off_eff_rank INT,
    adj_def_eff NUMERIC,
    adj_def_eff_rank INT,
    tempo NUMERIC,
    tempo_rank INT,
    luck NUMERIC,
    luck_rank INT,
    sos_adj NUMERIC,
    sos_adj_rank INT,
    sos_opp_adj NUMERIC,
    sos_opp_adj_rank INT,
    ncsos_adj NUMERIC,
    ncsos_adj_rank INT
);

-- SUMMARY
CREATE TABLE kenpom_summary (
    raw_text TEXT
);

-- POINT DISTRIBUTION
CREATE TABLE kenpom_point_distribution (
    year INT,
    team TEXT,
    pct_2pt NUMERIC,
    pct_2pt_rank INT,
    pct_3pt NUMERIC,
    pct_3pt_rank INT,
    pct_ft NUMERIC,
    pct_ft_rank INT,
    pct_2pt_allowed NUMERIC,
    pct_2pt_allowed_rank INT,
    pct_3pt_allowed NUMERIC,
    pct_3pt_allowed_rank INT,
    pct_ft_allowed NUMERIC,
    pct_ft_allowed_rank INT
);

-- MISC
CREATE TABLE kenpom_misc (
    year INT,
    team TEXT,
    experience NUMERIC,
    experience_rank INT,
    continuity NUMERIC,
    continuity_rank INT,
    height NUMERIC,
    height_rank INT,
    bench_minutes NUMERIC,
    bench_minutes_rank INT
);

-- HEIGHT
CREATE TABLE kenpom_height (
    year INT,
    team TEXT,
    height NUMERIC,
    height_rank INT
);

-- MAPPING TABLE
CREATE TABLE team_mapping (
    team_id SERIAL PRIMARY KEY,
    kenpom_name TEXT,
    espn_name TEXT,
    conference TEXT
);


INSERT INTO team_mapping (kenpom_name)
SELECT DISTINCT team
FROM kenpom_offense;

ALTER TABLE kenpom_offense ADD COLUMN team_id INT;
ALTER TABLE kenpom_defense ADD COLUMN team_id INT;
ALTER TABLE kenpom_efficiency ADD COLUMN team_id INT;
ALTER TABLE kenpom_misc ADD COLUMN team_id INT;
ALTER TABLE kenpom_height ADD COLUMN team_id INT;

UPDATE kenpom_offense o
SET team_id = m.team_id
FROM team_mapping m
WHERE TRIM(LOWER(o.team)) = TRIM(LOWER(m.kenpom_name));

UPDATE kenpom_defense d
SET team_id = m.team_id
FROM team_mapping m
WHERE TRIM(LOWER(d.team)) = TRIM(LOWER(m.kenpom_name));

UPDATE kenpom_efficiency e
SET team_id = m.team_id
FROM team_mapping m
WHERE TRIM(LOWER(e.team)) = TRIM(LOWER(m.kenpom_name));

UPDATE kenpom_misc m2
SET team_id = m.team_id
FROM team_mapping m
WHERE TRIM(LOWER(m2.team)) = TRIM(LOWER(m.kenpom_name));

UPDATE kenpom_height h
SET team_id = m.team_id
FROM team_mapping m
WHERE TRIM(LOWER(h.team)) = TRIM(LOWER(m.kenpom_name));

ALTER TABLE kenpom_offense
ADD CONSTRAINT fk_offense_team FOREIGN KEY (team_id) REFERENCES team_mapping(team_id);

ALTER TABLE kenpom_defense
ADD CONSTRAINT fk_defense_team FOREIGN KEY (team_id) REFERENCES team_mapping(team_id);

ALTER TABLE kenpom_efficiency
ADD CONSTRAINT fk_efficiency_team FOREIGN KEY (team_id) REFERENCES team_mapping(team_id);

ALTER TABLE kenpom_misc
ADD CONSTRAINT fk_misc_team FOREIGN KEY (team_id) REFERENCES team_mapping(team_id);

ALTER TABLE kenpom_height
ADD CONSTRAINT fk_height_team FOREIGN KEY (team_id) REFERENCES team_mapping(team_id);

CREATE INDEX idx_offense_team_id ON kenpom_offense(team_id);
CREATE INDEX idx_defense_team_id ON kenpom_defense(team_id);
CREATE INDEX idx_efficiency_team_id ON kenpom_efficiency(team_id);

SELECT COUNT(*) 
FROM kenpom_offense 
WHERE team_id IS NULL;

-- Check join works
SELECT m.kenpom_name, o.year, o.adj_off_eff, d.adj_def_eff
FROM kenpom_offense o
JOIN team_mapping m ON o.team_id = m.team_id
LEFT JOIN kenpom_defense d 
    ON o.team_id = d.team_id AND o.year = d.year
LIMIT 10;










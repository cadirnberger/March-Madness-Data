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


-- MARCH MADNESS MAIN DATA
CREATE TABLE march_madness_games (
    year INT,
    team TEXT,
    opponent TEXT,
    seed INT,
    round TEXT,
    result TEXT
);















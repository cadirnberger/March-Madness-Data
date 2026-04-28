CREATE TABLE tournament (
	tournament_id SERIAL,
	year INT NOT NULL UNIQUE,
	CONSTRAINT tournament_key 
		PRIMARY KEY (tournament_id),
	CONSTRAINT chk_year
		CHECK (year BETWEEN 2008 AND 2026)
	
); 
	
CREATE TABLE conference (
	conference_id SERIAL,
	conference_name VARCHAR(50) UNIQUE NOT NULL,
	
	CONSTRAINT conference_key 
		PRIMARY KEY (conference_id)
);


CREATE TABLE upset (
    upset_id SERIAL PRIMARY KEY,
    upset_year INT,
    round INT,
    seed_won INT,
    seed_lost INT,
    seed_diff INT,

    CONSTRAINT chk_year
        CHECK (upset_year BETWEEN 2008 AND 2026),

    CONSTRAINT chk_round
        CHECK (round BETWEEN 0 AND 64),
		
    CONSTRAINT chk_seed_won
        CHECK (seed_won BETWEEN 1 AND 16),

    CONSTRAINT chk_seed_lost
        CHECK (seed_lost BETWEEN 1 AND 16)
);


	
CREATE TABLE team_tournament_result (
    team_id INT,
    tournament_id INT,
    round_reached INT,
    seed INT,
    PRIMARY KEY (team_id, tournament_id),
	
	CONSTRAINT fk_ttr_team
        FOREIGN KEY (team_id)
        REFERENCES team(team_id),

    CONSTRAINT fk_ttr_tournament
        FOREIGN KEY (tournament_id)
        REFERENCES tournament(tournament_id)
);

CREATE TABLE conference_tournament_stats (
    conference_id INT NOT NULL,
	tournament_id INT NOT NULL,
    year INT NOT NULL,

    tournament_games INT DEFAULT 0,
    tournament_wins INT DEFAULT 0,
    tournament_losses INT DEFAULT 0,

    round_64 INT DEFAULT 0,
    round_32 INT DEFAULT 0,
    sweet_16 INT DEFAULT 0,
    elite_8 INT DEFAULT 0,
    final_4 INT DEFAULT 0,
    final_2 INT DEFAULT 0,
    champion INT DEFAULT 0,

    PRIMARY KEY (conference_id, year),

    CONSTRAINT fk_conf_stats
        FOREIGN KEY (conference_id)
        REFERENCES conference(conference_id),

     CONSTRAINT fk_tournment_id
        FOREIGN KEY (tournament_id)
        REFERENCES tournament(tournament_id)
);



CREATE UNIQUE INDEX idx_tournament_year
ON tournament(year);

CREATE INDEX idx_ttr_team
ON team_tournament_result(team_id);

CREATE INDEX idx_ttr_tournament
ON team_tournament_result(tournament_id);

CREATE INDEX idx_ttr_team_year
ON team_tournament_result(team_id, tournament_id);


CREATE INDEX idx_conf_stats_conf_year
ON conference_tournament_stats(conference_id, tournament_id);

CREATE INDEX idx_upset_year
ON upset(upset_year);



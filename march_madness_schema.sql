CREATE TABLE tournament (
	tournament_game_id SERIAL,
	ranking INT NOT NULL,
	tournament_game_loc VARCHAR(50) NOT NULL,
	year INT NOT NULL,
	team_id SERIAL NOT NULL,
	conference_id SERIAL NOT NULL,
	round INT NOT NULL,
	CONSTRAINT tournament_key 
		PRIMARY KEY (tournament_game_id),
	CONSTRAINT fk_conference
		FOREIGN KEY (conference_id)
        REFERENCES conference(conference_id),
	CONSTRAINT fk_team
		FOREIGN KEY (team_id)
        REFERENCES team(team_id),
	CONSTRAINT chk_ranking
        CHECK (ranking BETWEEN 1 AND 16),
	CONSTRAINT chk_round
		CHECK (round BETWEEN 1 AND 64),
	CONSTRAINT chk_year
		CHECK (year BETWEEN 2008 AND 2026)
	
); 

CREATE INDEX idx_pt_tournament
    ON tournament(tournamant_game_id);
	
CREATE TABLE conference (
	conference_id SERIAL,
	conference_name VARCHAR(50),
	tournament_games INT,
	tournament_win INT,
	tournament_loss INT,
	round_64 INT,
	round_32 INT, 
	sweet_16 INT,
	elite_8 INT,
	final_4 INT,
	final_2 INT, 
	champ INT,
	CONSTRAINT conference_key 
		PRIMARY KEY (conference_id),
	CONSTRAINT chk_tournament_games
        CHECK (tournament_games BETWEEN 0 AND 100),
	CONSTRAINT chk_tournament_win
        CHECK (tournament_win BETWEEN 0 AND 100),
	CONSTRAINT chk_tournament_loss
        CHECK (tournament_loss BETWEEN 0 AND 100),
	CONSTRAINT chk_round_64
        CHECK (round_64 BETWEEN 0 AND 100),
	CONSTRAINT chk_round_32
        CHECK (round_32 BETWEEN 0 AND 100),
	CONSTRAINT chk_sweet_16
        CHECK (sweet_16 BETWEEN 0 AND 100),
	CONSTRAINT chk_elite_8
        CHECK (ranking BETWEEN 0 AND 100),
	CONSTRAINT chk_final_4
        CHECK (final_4 BETWEEN 0 AND 100),
	CONSTRAINT chk_final_2
        CHECK (final_2 BETWEEN 0 AND 100),
	CONSTRAINT chk_champ
        CHECK (champ BETWEEN 0 AND 100)
		
);
CREATE INDEX idx_pt_conference
    ON conference(conference_id);

CREATE TABLE upset (
	upset_id SERIAL,
	upset_year INT,
	round INT,
	seed_won INT,
	seed_lost INT,
	seed_diff INT,
	CONSTRAINT upset_key 
		PRIMARY KEY (upset_id),
	CONSTRAINT chk_upset_year
        CHECK (upset_year BETWEEN 0 AND 100)
	CONSTRAINT chk_round
        CHECK (round BETWEEN 0 AND 100)
	CONSTRAINT chk_seed_won
        CHECK (seed_won BETWEEN 0 AND 100)
	CONSTRAINT chk_seed_lost
        CHECK (seed_lost BETWEEN 0 AND 100)
	CONSTRAINT chk_seed_diff
        CHECK (seed_diff BETWEEN 0 AND 100)
);
CREATE INDEX idx_pt_upset
    ON upset(upset_id);



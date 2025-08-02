CREATE TABLE netflix_originals_strict (
    -- core columns (add or rename to match your current schema)
    id            INT            PRIMARY KEY AUTO_INCREMENT,
    title         VARCHAR(255)   NOT NULL,
    language      VARCHAR(60),
    premiere_date DATE,
    runtime       INT            NOT NULL,
    imdb_score    DECIMAL(3,1)   NOT NULL,
    
    -- any other columns you want …

    /* ------------------  CHECK constraints  ------------------ */
    CONSTRAINT chk_imdb_score
        CHECK (imdb_score BETWEEN 0 AND 10),
    CONSTRAINT chk_runtime
        CHECK (runtime > 25)
);


-- 1. Make a structural copy (no data yet)
CREATE TABLE netflix_originals_strict LIKE netflix_originals;

-- 2. Add the CHECK constraints
ALTER TABLE netflix_originals_strict
    ADD CONSTRAINT chk_imdb_score
        CHECK (IMDBScore BETWEEN 0 AND 10),
    ADD CONSTRAINT chk_runtime
        CHECK (Runtime > 30);
        
        
INSERT INTO netflix_originals_strict (title, runtime, imdb_score)
VALUES ('Short but OK', 35, 6.0);   -- 35 > 30, 6.0 is in range



      


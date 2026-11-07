-- NewsTrack Phase 3
-- Table 5: TRANSCRIPT_SOURCES

USE NewsTrack;

CREATE TABLE IF NOT EXISTS TRANSCRIPT_SOURCES (
    source_id INT AUTO_INCREMENT PRIMARY KEY,
    transcript_id INT NOT NULL,
    source_name VARCHAR(150) NOT NULL,
    source_url VARCHAR(1000) NOT NULL,
    source_type VARCHAR(50) NOT NULL,
    collected_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_sources_transcript
        FOREIGN KEY (transcript_id)
        REFERENCES TRANSCRIPTS(transcript_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    INDEX idx_sources_transcript (transcript_id),
    INDEX idx_sources_type (source_type)

) ENGINE = InnoDB;

DESCRIBE TRANSCRIPT_SOURCES;
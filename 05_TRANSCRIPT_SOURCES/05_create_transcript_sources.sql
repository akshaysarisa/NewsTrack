-- NewsTrack Phase 3
-- Table 5: TRANSCRIPT_SOURCES

USE NewsTrack;

CREATE TABLE IF NOT EXISTS TRANSCRIPT_SOURCES (
    source_id INT AUTO_INCREMENT PRIMARY KEY,
    transcript_id INT NOT NULL,
    source_type VARCHAR(50) NOT NULL,
    source_reference VARCHAR(500),
    added_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_sources_transcript
        FOREIGN KEY (transcript_id)
        REFERENCES TRANSCRIPTS(transcript_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE = InnoDB;

DESCRIBE TRANSCRIPT_SOURCES;

-- NewsTrack Phase 3
-- Table 4: TRANSCRIPTS

USE NewsTrack;

CREATE TABLE IF NOT EXISTS TRANSCRIPTS (
    transcript_id INT AUTO_INCREMENT PRIMARY KEY,
    schedule_id INT NOT NULL,
    transcript_text LONGTEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT uq_transcript_schedule
        UNIQUE (schedule_id),

    CONSTRAINT fk_transcripts_schedule
        FOREIGN KEY (schedule_id)
        REFERENCES DAILY_SCHEDULE(schedule_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE = InnoDB;

DESCRIBE TRANSCRIPTS;

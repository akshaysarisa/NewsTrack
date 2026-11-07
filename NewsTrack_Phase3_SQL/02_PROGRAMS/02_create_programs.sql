-- NewsTrack Phase 3
-- Table 2: PROGRAMS

USE NewsTrack;

CREATE TABLE IF NOT EXISTS PROGRAMS (
    program_id INT AUTO_INCREMENT PRIMARY KEY,
    channel_id INT NOT NULL,
    program_name VARCHAR(100) NOT NULL,
    description TEXT,

    CONSTRAINT fk_programs_channel
        FOREIGN KEY (channel_id)
        REFERENCES CHANNELS(channel_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE = InnoDB;

DESCRIBE PROGRAMS;

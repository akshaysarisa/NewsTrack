-- NewsTrack Phase 3
-- Table 1: CHANNELS

USE NewsTrack;

CREATE TABLE IF NOT EXISTS CHANNELS (
    channel_id INT AUTO_INCREMENT PRIMARY KEY,
    channel_name VARCHAR(100) NOT NULL,
    language VARCHAR(50),
    country VARCHAR(50)
) ENGINE = InnoDB;

DESCRIBE CHANNELS;

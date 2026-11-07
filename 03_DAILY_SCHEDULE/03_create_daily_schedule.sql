
-- NewsTrack Phase 3
-- Table 3: DAILY_SCHEDULE

USE NewsTrack;

CREATE TABLE IF NOT EXISTS DAILY_SCHEDULE (
    schedule_id INT AUTO_INCREMENT PRIMARY KEY,
    program_id INT NOT NULL,
    broadcast_date DATE NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,

    CONSTRAINT fk_schedule_program
        FOREIGN KEY (program_id)
        REFERENCES PROGRAMS(program_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT chk_schedule_time
        CHECK (end_time > start_time),

    CONSTRAINT uq_program_broadcast_slot
        UNIQUE (program_id, broadcast_date, start_time),

    INDEX idx_schedule_date (broadcast_date),
    INDEX idx_schedule_program_date (program_id, broadcast_date)

) ENGINE = InnoDB;

DESCRIBE DAILY_SCHEDULE;
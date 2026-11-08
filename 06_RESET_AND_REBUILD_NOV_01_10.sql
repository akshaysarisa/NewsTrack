
USE NewsTrack;

-- STEP 1: Remove the old demo dataset
START TRANSACTION;

DELETE FROM TRANSCRIPT_SOURCES;
DELETE FROM TRANSCRIPTS;
DELETE FROM DAILY_SCHEDULE;

DELETE p
FROM PROGRAMS p
JOIN CHANNELS c ON p.channel_id = c.channel_id
WHERE c.channel_name NOT IN ('NDTV', 'BBC News');

DELETE FROM CHANNELS
WHERE channel_name NOT IN ('NDTV', 'BBC News');

COMMIT;

-- STEP 2: Create schedules for November 1-10, 2026
-- These are illustrative time slots, not verified broadcast timings.

INSERT INTO DAILY_SCHEDULE
(program_id, broadcast_date, start_time, end_time)
WITH RECURSIVE dates AS (
    SELECT DATE('2026-11-01') AS broadcast_date
    UNION ALL
    SELECT DATE_ADD(broadcast_date, INTERVAL 1 DAY)
    FROM dates
    WHERE broadcast_date < '2026-11-10'
)
SELECT
    p.program_id,
    d.broadcast_date,
    CASE p.program_name
        WHEN 'India Matters' THEN '09:00:00'
        WHEN 'Newsroom' THEN '12:00:00'
        WHEN 'The Big Fight' THEN '20:00:00'
        WHEN 'BBC Breakfast' THEN '06:00:00'
        WHEN 'World News' THEN '18:00:00'
        WHEN 'News at Ten' THEN '22:00:00'
    END,
    CASE p.program_name
        WHEN 'India Matters' THEN '10:00:00'
        WHEN 'Newsroom' THEN '13:00:00'
        WHEN 'The Big Fight' THEN '21:00:00'
        WHEN 'BBC Breakfast' THEN '09:00:00'
        WHEN 'World News' THEN '19:00:00'
        WHEN 'News at Ten' THEN '23:00:00'
    END
FROM PROGRAMS p
JOIN CHANNELS c ON p.channel_id = c.channel_id
CROSS JOIN dates d
WHERE c.channel_name IN ('NDTV', 'BBC News');

-- STEP 3: Verify the rebuilt dataset
SELECT
    (SELECT COUNT(*) FROM CHANNELS) AS total_channels,
    (SELECT COUNT(*) FROM PROGRAMS) AS total_programs,
    (SELECT COUNT(*) FROM DAILY_SCHEDULE) AS total_schedules,
    (SELECT COUNT(*) FROM TRANSCRIPTS) AS total_transcripts,
    (SELECT COUNT(*) FROM TRANSCRIPT_SOURCES) AS total_sources;

SELECT
    c.channel_name,
    p.program_name,
    COUNT(ds.schedule_id) AS scheduled_days
FROM CHANNELS c
JOIN PROGRAMS p ON c.channel_id = p.channel_id
LEFT JOIN DAILY_SCHEDULE ds ON p.program_id = ds.program_id
GROUP BY c.channel_name, p.program_name
ORDER BY c.channel_name, p.program_name;

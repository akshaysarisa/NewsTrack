

\# NewsTrack – Entity Relationship Diagram

!\[NewsTrack Entity Relationship Diagram](ERDIAGRAM.png)



\## Project Description

NewsTrack is a MySQL-based Daily News Broadcast and Transcript Management System. It manages news channels, their programs, daily broadcasting schedules, transcripts, and transcript sources.



\## Entities and Attributes



\### 1. CHANNELS

\- channel\_id (Primary Key)

\- channel\_name

\- language

\- country



\### 2. PROGRAMS

\- program\_id (Primary Key)

\- channel\_id (Foreign Key)

\- program\_name

\- description



\### 3. DAILY\_SCHEDULE

\- schedule\_id (Primary Key)

\- program\_id (Foreign Key)

\- broadcast\_date

\- start\_time

\- end\_time



\### 4. TRANSCRIPTS

\- transcript\_id (Primary Key)

\- schedule\_id (Foreign Key, UNIQUE)

\- transcript\_text

\- created\_at



\### 5. TRANSCRIPT\_SOURCES

\- source\_id (Primary Key)

\- transcript\_id (Foreign Key)

\- source\_type

\- source\_reference

\- added\_at



\## Relationships

1\. One CHANNEL can have many PROGRAMS (1:M).

2\. One PROGRAM can appear in many DAILY\_SCHEDULE records (1:M).

3\. One DAILY\_SCHEDULE record can have zero or one TRANSCRIPT (1:0..1).

4\. One TRANSCRIPT can have many TRANSCRIPT\_SOURCES (1:M).



\## Design Notes

\- Primary Keys uniquely identify each record.

\- Foreign Keys connect related tables.

\- UNIQUE on TRANSCRIPTS.schedule\_id ensures that each scheduled broadcast has at most one transcript.




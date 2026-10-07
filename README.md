# Ghanari

Relational database and console client for a Twitter-like social network: accounts, tweets, comments, likes, hashtags, follows, blocks, and direct messages.

## Highlights

- Normalized MySQL schema with foreign keys for members, tweets, messages, follows, blocks, and favorites
- Stored procedures for signup, login, posting, social graph actions, and messaging
- Interactive Python CLI that calls those procedures

## Layout

```
ghanari-db/
├── sql/                 # Phase 1 procedure scripts and ERD
│   ├── create_tables.sql
│   ├── create_account.sql
│   ├── send_tweet.sql
│   └── erd.png
├── schema/ghanari.sql   # Full schema dump
├── console/ghanari.py   # Phase 2 CLI
└── README.md
```

## Setup

1. Create a MySQL database named `Ghanari`.
2. Load the schema:

```bash
mysql -u root -p Ghanari < schema/ghanari.sql
```

3. Copy `.env.example` values into your shell, then run the CLI:

```bash
pip install mysql-connector-python colorama
cd console
python ghanari.py
```

Set `MYSQL_USER`, `MYSQL_PASSWORD`, `MYSQL_HOST`, and `MYSQL_DATABASE` before connecting. Do not commit real credentials.

## CLI commands

The console lists numbered actions (sign up, sign in, tweet, follow, block, like, hashtag search, DMs, and more). Enter `0` to quit.

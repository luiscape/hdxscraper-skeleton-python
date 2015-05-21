## HDX Scraper / Collector Skeleton
This is a skeleton of a Python scraper / collector used by the Humanitarian Data Exchange project to collect data from the web (i.e. websites or APIs). The scraper is designed to work in a ScraperWiki "box", however it can be deployed virtually in any Unix environment.

## Folder Structure
```
.
├── scraperwiki.sqlite
└── tool
    ├── LICENSE.md
    ├── README.md
    ├── config
    │   ├── dev.json
    │   └── prod.json
    ├── data
    │   └── country_list.csv
    ├── http
    │   └── index.html
    ├── requirements.txt
    ├── run.sh
    ├── scripts
    │   ├── example_collect
    │   │   ├── __init__.py
    │   │   ├── __main__.py
    │   │   ├── clean.py
    │   │   ├── collect.py
    │   │   └── patch.py
    │   ├── setup
    │   │   ├── __init__.py
    │   │   ├── __main__.py
    │   │   └── database.py
    │   └── utilities
    │       ├── __init__.py
    │       ├── db.py
    │       └── pretty_print.py
    ├── setup.sh
    └── tests
        ├── test_aggregation.py
        └── test_database_structure.py
```

## Setup Structure


## Usage Structure


## Tests Structure


## Collector / Scraper Structure


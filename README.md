## HDX Scraper / Collector Skeleton
This is a skeleton of a Python scraper / collector used by the [Humanitarian Data Exchange](http://data.hdx.rwlabs.org/) project to collect data from the web (i.e. websites or APIs). The scraper is designed to work in a [ScraperWiki](http://scraperwiki.com/) "box", however it can be deployed virtually in any Unix environment.

For detailed documentation about how to create and manage scrapers on ScraperWiki please refer to its officual documentation [here](https://scraperwiki.com/help).

## Setup Structure
The shell script `setup.sh` should contain all the necessary calls for respective setup scripts and also calls to install dependencies. Some scripts may require a database to be setup first, before they are able to run successfully; other require some special configuration. [`setup.sh`](setup.sh) contains an example:

```shell
#!/bin/bash

#
# Installing dependencies.
#
virtualenv venv
source venv/bin/activate
pip install -r requirements.txt
pip install node  # for tests

#
# Running collector-specific setup scripts.
#
python tool/scripts/setup/
```

In the example above, the collector-specific scritps will setup the tables of a SQLite database. Click [here]('scripts/setup/database.py') to explore that script in more detail.

You can also include crontab configuration in the script above. Here's an example:

```shell
crontab -l | { cat; echo "@daily bash tool/run.sh"; } | crontab -
```
That should configure the collector / scraper to run on a daily schedule.

## Usage Structure
The shell script `run.sh` contains all the necessary calls to run the script automatically. Here's an example:

```shell
#!/bin/bash

#
# Running the collector / scraper. 
#
source venv/bin/activate
python tool/scripts/example_collect/ > tool/http/log.txt
```

Notice that in the implementation above we are storing the `stdout` on a file called `log.txt`. That file is placed on the folder [`http`](http/) because all the files on that folder are available on the box's API endpoint. It will be available in an URL with the following pattern:

```
> https://ds-ec2.scraperwiki.com/[BOX_ID]/[TOOL_ID]/http/log.txt
```


## Collector / Scraper Structure
```
.
├── scraperwiki.sqlite
└── tool
    ├── config
    │   ├── dev.json
    │   └── prod.json
    ├── data
    │   └── country_list.csv
    ├── http
    │   └── index.html
    ├── tests
    │   ├── test_aggregation.py
    │   └── test_database_structure.py
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
    ├── run.sh
    ├── setup.sh
    ├── test.sh
    ├── requirements.txt
    ├── LICENSE.md
    └── README.md
    
```


## Tests Structure
For now, we write our tests using Python's native `unittest`. We use `nose` to run those tests. The shell script `test.sh` should contain all the necessary calls to run the tests you've written:

```shell
#!/bin/bash

#
# Running tests with Nose.
#
source venv/bin/activate
nosetests --with-coverage
```


# `vesti`: a database-driven investment platform MVP

## `vesti` User Archetypes:
1. Administrator
    * an administrator at the firm. They oversee many advisors and provide strategical insight.
2. Advisor
   * an advisor at the firm advises many clients based on their investment profile.
3. Client
   * a client can buy and sell securities. They can have many portfolios, each with their own investment profile. Each client has 1 advisor. Advisors can recommend stocks based on a client's investment profile.

## What's in this Repo:
* `db`
  * Contains a MYSQL bootstrap file which creates the database, grants all privileges to the webapp, creates the tables, and inserts sample data. This file is run every time the Docker container is spun up.
* `flask-app`
  * `src`
    * Within `src`, there are subdirectories for each of the user archetypes. Within these subdirectories, there are files that set up the routes for each respective user archetype and their associated Flask Blueprint.
    * The `__init__.py` file within `src` contains utility functions, most important being `create_app()` which, as the name would suggest, creates the app. Additionally, the MySQL object that we will use in other parts of the API is contained within `__init__.py`.
  * `app.py`
    * As the name would suggest, creates the app.
  * `Dockerfile`
    * Configures the Docker container.
* `docker-compose.yml`
    * Sets up the webserver and MySQL container.

## What's Next?
* Roadblocks. Time constraints and issues with installing packages in the Docker container served as a roadblock. As a result, I wasn't able to incorporate the `investment_profile` table from the database to the extent I had originally planned. Next, I wasn't able to come up with a solution to validate tickers resulting in UI limitations. Finally, I had issues generating tickers with Mockaroo as it would generate tickers from foreign stock exchanges which caused issues with the Yahoo Finance API. Since there was no way to restrict the tickers that Mockaroo would generate, I had to randomly generate tickers from a subset of tickers on the NYSE.
* Performance. As an MVP, I focused the majority of the time on functionality as opposed to performance. I attempted to optimize performance in 2 ways:
  1. A JIT approach to value. Instead of constantly or periodically updating the value of stocks and portfolios, they were updated just before they were queried.  
  2. Caching the stock prices retrieved from the Yahoo Finance API. 

    If I were to come back to this project, I would learn more about multithreading and see if applying it to my API calls would be a viable approach to optimize performance.
* Testing. I am familiar with Python testing frameworks like pytest and unittest, however, I don't know how to approach testing this application. Testing Flask routes, and, more generally, how to test a program within a Docker container are topics I would have to learn.
* Frontend. Implementing `vesti` with a frontend framework as opposed to a low-code tool like Appsmith would be a challenging project. However, I am not sure where and how to start.
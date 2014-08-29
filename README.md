# Food Database Platform API Project

## food-rails Code
	git clone git@github.com:abhijeetkoli/food-rails.git

## Ruby 

### Install rvm

	user$ \curl -sSL https://get.rvm.io | bash -s stable

### Install bundler

	gem install bundler

## MySQL

[Download MySQL Community Edition](http://www.oracle.com/us/products/mysql/mysqlcommunityserver/overview/index.html)

## bundler
	
	cd food-rails
	bundle install
	
## Development Database
	
	rake db:create
	rake db:migrate

## Seed Data

### Rake task will import data from csv files at db/csv.
	
	rake db_populate

### Active Admin User

	rake db:seed

## Generate API Key
	
	rails console
	ApiKey.create


## Start Web Server

	rails server

## Active Admin Dashboard

	http://localhost:3000/admin

	efradmin@theefrproject.com
	password

## Development

1. Create a local branch for your issue
	`git checkout -b feature-description master`

2. Track all changes for commit
	`git add -A`

3. Commit changes to local repository
	`git commit -m "feature description"`
	
3. Push branch to food-rails remote repository
	`git push -u origin feature-description`	

4. Create pull request for the pushed branch from GitHub

## API Examples

### Registration
	
	curl -v -H 'Authorization: Token token="cc1186e098f57fb41f5351bbe7462ae1"' -H 'Content-Type: application/json' -H 'Accept: application/json' -X POST http://localhost:3000/api/v1/registrations -d "{\"user\":{\"username\":\"efruser\",\"email\":\"efruser@theefrproject.com\",\"password\":\"password\",\"password_confirmation\":\"password\"}}"

### Login

	curl -v -H 'Authorization: Token token="cc1186e098f57fb41f5351bbe7462ae1"' -H 'Content-Type: application/json' -H 'Accept: application/json' -X POST http://localhost:3000/api/v1/sessions -d "{\"user\":{\"email\":\"efruser@theefrproject.com\",\"password\":\"password\"}}"

### Nutrients

	curl -v -H 'Authorization: Token token="cc1186e098f57fb41f5351bbe7462ae1"' -H 'Content-Type: application/json' -H 'Accept: application/json' -X GET http://localhost:3000/api/v1/nutrients -d "{\"auth_token\":\"r4m8ztxJptizvArzHkR1\", \"user_email\":\"efruser@theefrproject.com\"}"

### Food Search

	curl -v -H 'Authorization: T/sensien="cc1186e098f57fb41f5351bbe7462ae1"' -H 'Content-Type: application/json' -H 'Accept: application/json' -X GET http://localhost:3000/api/v1/foods -d "{\"auth_token\":\"r4m8ztxJptizvArzHkR1\", \"user_email\":\"efruser@theefrproject.com\",\"search\":{\"long_description\":\"apple\",\"food_group_id\":1,\"offset\":0,\"limit\":100}}"

### Food Record

	curl -v -H 'Authorization: Token token="cc1186e098f57fb41f5351bbe7462ae1"' -H 'Content-Type: application/json' -H 'Accept: application/json' -X GET http://localhost:3000/api/v1/foods/2178 -d "{\"auth_token\":\"r4m8ztxJptizvArzHkR1\", \"user_email\":\"efruser@theefrproject.com\"}"

### Nutrient Search

	curl -v -H 'Authorization: Token token="cc1186e098f57fb41f5351bbe7462ae1"' -H 'Content-Type: application/json' -H 'Accept: application/json' -X GET http://localhost:3000/api/v1/foods -d "{\"auth_token\":\"r4m8ztxJptizvArzHkR1\",  \"user_email\":\"efruser@theefrproject.com\",\"search\":{\"nutrient_id\":1,\"food_group_id\":1,\"offset\":0,\"limit\":100}}"

### Logout

	curl -v -H 'Authorization: Token token="cc1186e098f57fb41f5351bbe7462ae1"' -H 'Content-Type: application/json' -H 'Accept: application/json' -X DELETE http://localhost:3000/api/v1/sessions -d "{\"auth_token\":\"r4m8ztxJptizvArzHkR1\", \"user_email\":\"efruser@theefrproject.com\"}" 

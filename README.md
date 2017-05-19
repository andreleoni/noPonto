![noPontoApp](http://noponto.herokuapp.com/header.png)

![ruby](https://img.shields.io/badge/Ruby-2.3.4-red.svg)
![rails](https://img.shields.io/badge/Rails-5.0.1-red.svg)
[![Code Climate](https://codeclimate.com/github/andreleoni/noPonto/badges/gpa.svg)](https://codeclimate.com/github/andreleoni/noPonto) [![Issue Count](https://codeclimate.com/github/andreleoni/noPonto/badges/issue_count.svg)](https://codeclimate.com/github/andreleoni/noPonto)


## What is noPonto?

The aim of the project is to make access to the information easy for people who want to take the bus in São Paulo. We delivery everything in a simple and clear way. Type where you want to go in the search box and you get all the information you need to reach the destination.


The app can be accessed by any device on [this](http://noponto.herokuapp.com/) link

## [Stack](https://stackshare.io/noponto)
- Ruby (on Rails)
- CoffeeScript
- Heroku
- Slack
- [Trello](https://trello.com/b/paM4tPSh/nopontoapp)
- SPTrans API
- Google Maps
- Docker

## I want to contribute

Everyone is welcome to contribute to the project and improve the way people get information about bus traffic.

To contribute follow the steps below:

### 1. Fork this repository
### 2. Clone your fork to a local repository
```
git clone your-foked-repository
cd your-foked-repository
```
### 3. Preparing Ambient
- Rename the file of ambient variables from .env.example to .env.

### 4. Run docker-composer build
```
docker-compose build
```
### 5. Run migrations
```
docker-compose run --rm app rake db:create db:migrate
```
### 6. Run tests
```
docker-compose run --rm app rspec
```
### 7. Start the app
```
docker-compose up
```
### 8. Add the original repository as a source in your local repository
```
git remote add upstream https://github.com/andreleoni/noPonto
```
### 9. Sync your repository with the original
```
git fetch upstream
```
### 10. Update local repository
```
git checkout master
git merge upstream/master
```
### 11. Create a new branch
```
git checkout -b my-new-feature
```
### 12. Make a pull request

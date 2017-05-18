![noPontoApp](http://noponto.herokuapp.com/header.png)


[![Code Climate](https://codeclimate.com/github/andreleoni/noPonto/badges/gpa.svg)](https://codeclimate.com/github/andreleoni/noPonto) [![Issue Count](https://codeclimate.com/github/andreleoni/noPonto/badges/issue_count.svg)](https://codeclimate.com/github/andreleoni/noPonto)


## What is noPonto?
The aim of the project is to make the access to the information easy to people who want to move by bus in São Paulo. We maintain everything simple and clear. Typing where you want to go in the search box you get all the information you need to reach the destination.

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
### 3. Run docker-composer build
```
docker-compose build
```
### 4. Run migrations
```
docker-compose run --rm app rake db:create db:migrate
```
### 5. Run tests
```
docker-compose run --rm app rspec
```
### 6. Start the app
```
docker-compose up
```
### 7. Add the original repository as a source in your local repository
```
git remote add upstream https://github.com/andreleoni/noPonto
```
### 8. Sync your repository with the original
```
git fetch upstream
```
### 9. Update local repository
```
git checkout master
git merge upstream/master
```
### 10. Create a new branch
```
git checkout -b my-new-feature
```
### 11. Make a pull request

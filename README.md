# README

### About:
An introductory project to databases, active record and the Ruby on Rails framework. A database was established for use during the project. See `Database Schema` below for more info on its design. We then implemented the MVC (Model - View - Controller) design pattern of Rails with RESTful routing principles to allow users to create, read, update and delete (CRUD) resources to and from the database. Class and instance methods on a Rails model use ActiveRecord methods and helpers to access data. All line of code have been tested for accurate functionality.

### Built With:
This repository was built using Ruby v2.7.2 and Rails 5.2.6.
- Gems Used:
 - RSpec
 - Pry
 - SimpleCov  
 - Capybara
 - Launchy
 - Shoulda-Matchers v5.0
 - Orderly

### How to Use:
##### Downloading the Repo and Setup:
- Fork this Repo (optional)
- Clone the Repo
- In your terminal run the following:
  - `git clone <paste_repo>`
  - `cd <repo_name>`
  - `bundle install`
  - `rails db:{drop, create, migrate, seed}`

##### Viewing the App:
- From your CLI enter the following command
  - `rails server`
- Navigate to your web browser and visit one of the following pages:
  - localhost:3000/producers   
  - localhost:3000/producers/1  
  - localhost:3000/producers/1/discs
  - localhost:3000/discs  
  - localhost:3000/discs/1  
  - localhost:3000/directors   
  - localhost:3000/directors/1  
  - localhost:3000/directors/1/movies
  - localhost:3000/movies   
  - localhost:3000/movies/1  

### Database Schema

Our database was designed with 2 separate `one-to-many` relationships established. They only interact in the `one-to-many` context as illustrated in the image below. Each uses a minimum of 1 string, boolean and integer datatype for practice in accessing varying types of data.  
<img width="1214" alt="image" src="https://user-images.githubusercontent.com/91291406/153252300-5d08c34e-36d8-4350-8f74-70d7a6bb6be7.png">

### Testing:
Tests can be run using the following command into your CLI:
- `rspec spec/<file_name>` to run the tests on a particular spec file
- `bundle exec rspec` to run all files.

SimpleCov has been used to verify coverage.
A Simplecov report can be viewed by entering following into your CLI:
- `open coverage/index.html`

#### Authors:
- [Conor Barthel](https://github.com/conorbarthel)
- [Lisa Taylor](https://github.com/lisataylor5472)

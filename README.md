**Note** :I have used two spacing but somehow github adds 4 spaces

This is a simple clock event tracking application developed in Ruby on Rails. The application's front-end and back-end are developed in Rails 5.2.3 and ruby 2.5. 

The development server was ubuntu 14.04 LTS and the production server is heroku. The database for development server is sqlite where as for production it is postgres.

**Gems Used:**
* Authentication - devise
* Front End -
  * jquery-rails 
  * local_time
  * mini_racer
  * bootstrap

The applicaton consist of two models/modules:
1. **User**: <br/>
   This is generated using devise gem. Two extra fields are added i.e. name and role. By default role is user. Admin role is created using seeds.rb file.(credentials are present in seeds.rb)

2. **ClockEvent**: <br/>
	 This model is used to keep track of all the events. On homepage, it will always display today's events. In order to see all the events, user has to be admin and the url link is only available to admin(signed in) [Link to Clock Events](http://clockerapphimama.herokuapp.com/clock_events)

A user is created for you to test. user@example.com and 12345678

**Helpers:**
ClockEventHelper contains methods for displaying links and text on the main page.

**To deploy code on the new machine from scratch**
* Make sure ruby,rails and git are installed
* Download repository from github
* Go to the root of the application directory
* run bundle install
* if you are using sqlite then 
  1. run rails db:create
  2. run rails db:migrate
  3. run rails db:seed
* if you are running postgress
	1. install postgres
	2. add configuration in database.yml
	3. repeat step from 1 to 3 from sqlite step
* run rails s
* Go to localhost:3000 in the web browser

**How did you approach this challenge?**
* I intially decided to go with React as front-end and Sinatra as backend since it is a lighweight application. I even spend some couple of hours to figure some things out but eventually I ended up doing everything in Rails as I have experience in Rails for both front end and back end. I first implemented the core backend logic and then work on styling. I then added admin model to provide authorization of controlling clocked events.  


**What schema design did you choose and why?**
* I used SQL database because ActiveRecord is easy to work with. I used sqlite for development server as it was pretty fast to setup and run. For heroku, I used postgres as it doesn't support sqlite. 

* User
  * Currently, the user has a role attribute which is was used to distinguish between admin and a normal user. The important fields are email, password and name. Below it is defined what I would have done differently given a month.

* ClockEvent
  * ClockEvent has an attribute event type which stores the reason for what a user is clocking for, user_id to store user. I have used created_at attribute to store the timestamp and is_clocked to know if the user is clocked in or not

User has_many clock_events and clock_events belongs to user model. I have added dependent destroy, to destroy associated clock events, if a user is deleted.

**If you were given another day to work on this, how would you spend it?**
* I would have spend time on working more on timezone. Currently application supports local timezone but there were couple of hacks I have to use. I would research more and come up with more optimal and better way of doing this also added validation for time. 

* Also, right now the app only supports web version, I would have formated the API in such a way that they can be consumed by mobile apps. They can still use it as we just need to send json response. 

* Pagination and sortable columns which are very important.


**What if you were given a month?**
* I would've have spend on learning front-end framework and implement the APIs for the front-end to consume them. The features would include, user sign up using email, facebook and twitter(omniauth).

* I would have spend more time on schema design to support multiple institutions/organization to use this App. 

* For user model, I would have gone with three separate tables role, user and a join of them (Role-based Authorization and authentication). Roles would be but not limited to teacher, student,HR, principal, Administrator. 

* For ClockEvent model, the attribute event_type could have been used in two ways, I can think of.
  * Event type can be a type of event (string) which we currently have. It can be designed by constant values such as project, lunch, meeting, etc in model 
  * It can be used as a separate model where it can be linked to classes teacher is teaching. So say, teacher A will select a subject from dropdown(subject name from Subject tables) and clock in or clock out.


* A basic CMS website for promotion.

**References:**
* https://www.w3schools.com for displaying clock
* http://stackoverflow.com for timezone issues
* https://www.heroku.com/ for deployment
* https://github.com for version control
* Sublime Text Editior for coding
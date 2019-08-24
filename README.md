This is a simple clock event tracking application developed in Ruby on Rails. The application front-end and back-end are developed in Rails 5.2.3 and ruby2.5. 

The development server is ubuntu 14.04 LTS and the production server is heroku. The database for development server is sqlite where as for production it is postgres.

**Gems Used:**
* Authentication - devise
* Front End -
  * jquery-rails 
  * local_time
  * mini_racer
  * bootstrap

The applicaton consist of two models/modules:
1. **User**: <br/>
   This is generated using devise gem. Two extra fields are added i.e. name and role. By default role is user. Admin role is created using seeds file.

2. **ClockEvent**: <br/>
	 This model is used to keep track of all the events. On homepage, it will always display today's events. In order to see all the events, user has to be admin and the url link is only available to admin(signed in) [Link to Clock Events](http://clockerapphimama.herokuapp.com/clock_events)

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


**Future Implmentations**
*TODO

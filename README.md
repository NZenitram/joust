# Joust

### _Two solutions enter, one solution leaves._

![joust image](https://github.com/bermannoah/repo-images/blob/master/joust.jpg?raw=true)

This single page app is designed to pull submitted solutions from [Code of Arms](https://github.com/turingschool-projects/code-of-arms) and pit them against each other for the user's entertainment. Pick your preferred solution, leave a comment explaining your choice, and it's on to the next pairing.

## Using the app

To use Joust, visit https://code-of-arms-joust.herokuapp.com and log in with your [Census](https://turing-census.herokuapp.com) account. Upon login, you will see two solutions to the same exercise. Pick your preferred solution, add a comment, and click "Vote".

# Developing for Joust

## Contribution Guidelines

We're very welcoming of pull requests and issue/bug reports. We'd appreciate it if your submissions are fully tested - we're using RSpec/Capybara for our test framework, with Factory Girl for generating assorted objects. You can find a pretty decent intro to the above [here](https://robots.thoughtbot.com/how-we-test-rails-applications).

As far as Turing students, staff, and alumni are concerned: The Turing School Code of Conduct most likely covers everything here, but you can check out our contributor guidelines by clicking [here](https://github.com/NZenitram/joust/blob/master/GUIDELINES.md) for some basic rules to contributing to the project (and to open source in general) - this document is also helpful if you're not a current Turing student.

The best way to get in touch with us (because there's a rotating group of people maintaining the project) is probably by filing an issue report. Enjoy, and happy hacking! :)

## Requirements

```
Ruby on Rails
	- Rails version 5.0.1
	- Ruby version 2.3.0 (2.3.1 should also work)
	- Bundled with 1.13.6
PostgreSQL
Access to a Census account
```
If you don't have rails (or ruby) installed, this [tutorial](http://docs.railsbridge.org/intro-to-rails/) is a good place to start.

## Environment Variables

Joust will require the following environment variables. We'll go through how to add them to the project later, but for now, know that you'll need (at _least_) the following:

A [Census](https://turing-census.herokuapp.com) `id` and `secret`. Assuming you have a Census account, you'll login, click on Registered Applications, then click on New Application. From there you'll enter a name and a callback URL. At the time of writing there is an occasional hiccup with the callback URI - it sometimes defaults to HTTP instead of the required HTTPS - the hope is that this patched out in a future version of Census. Anyway. Give your app a name and add your callback URI/s. You will need:

` https://localhost:3001/auth/census/callback ` (local development)

and when you have the app on staging or production:

` https://your-app-url.herokuapp.com/auth/census/callback `

(Heroku is used there as an example. Play around with other deployment systems and see what you can do!)

Cool. Leave the "scope" section blank and hit submit. On the next page you'll be given an Application Id and Secret. You'll also be able to edit your callback URI/s if necessary. We'll go over what to do with the Id and Secret in the next section.

## Installation

 - First: clone down this repo:
  `git clone https://github.com/NZenitram/joust`
   or
   `git clone git@github.com:NZenitram/joust.git` for SSH.

 - run `bundle install` to make sure all your gems are properly added.
 - run `rake db:create db:migrate db:seed db:test:prepare` (you can run those all as one command but I like to have them separated out)
 - once the database is set up, run `figaro install` (`bundle exec figaro install` if you run into trouble). This will create an `application.yml` file in your `config/` directory and add that same file to your `.gitignore`.
 - EXTRA IMPORTANT: Before committing, run `git status` and be EXTRA CERTAIN that your gitignore is working properly and it's not about to commit all your precious secrets to Github.
 - Now go into your `application.yml` folder and add the following lines:

 ```
 CENSUS_ID: here's where you put the census application id

 CENSUS_SECRET: here's where you put the census secret
 ```
 - Cool. Almost there. Now, just to make sure you've got things configured properly go ahead and run `rspec` to make sure the tests are passing.

 Here's where things get interesting (not that they weren't already) and I'll hand you over to this primer for setting up HTTPS access on localhost from @NZenitram. You'll need to be able to run your server following these instructions, otherwise the Census OAuth authentication system won't work.

## Getting set up with HTTPS
_(The following has been borrowed with permission from [this](https://github.com/NZenitram/census_staging_oauth/blob/master/README.md) readme. You may need to follow the staging environment directions found at that link, depending on the circumstances under which you're working.)_

Please note that in order to use the Census OmniAuth strategy, your application must be configured to handle secured HTTPS requests. This is not the default setting on typical Rails applications run locally. For instructions on configuring SSL on a development version of your application. The following steps will supply your application with and SSL cert and allow you to use HTTPS from your local host.

Add this line to your application's Gemfile:

```ruby
# Gemfile

gem 'thin'
```

The execute:

```
$ bundle install
```

Now work through the following steps:

```
## 1) Create your private key (any password will do, we remove it below)

$ cd ~/.ssh
$ openssl genrsa -des3 -out server.orig.key 2048

## 2) Remove the password

$ openssl rsa -in server.orig.key -out server.key


## 3) Generate the csr (Certificate signing request) (Details are important!)

$ openssl req -new -key server.key -out server.csr

## IMPORTANT
## MUST have localhost.ssl as the common name to keep browsers happy
## (has to do with non internal domain names ... which sadly can be
## avoided with a domain name with a "." in the middle of it somewhere)

Country Name (2 letter code) [AU]:

#### Just press enter to get past prompts until you reach:
...
Common Name: localhost.ssl
...
#### Fill out the Common Name field and skip the rest.

## 4) Generate self signed ssl certificate

$ openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt

## 5) Finally Add localhost.ssl to your hosts file

$ echo "127.0.0.1 localhost.ssl" | sudo tee -a /private/etc/hosts

# 6) To start the SSL webserver open another terminal window and run

thin start -p 3001 --ssl --ssl-key-file ~/.ssh/server.key --ssl-cert-file ~/.ssh/server.crt
```

'Thin start -p 3001' will start your local host on port 3001. You will need to run the command in step 6.) in your application's directory. After it has started open your browser and visit 'localhost:3001'.

You will also need to visit your Census application profile and add "https://localhost:3001/auth/census/callback" to the list of redirect URLs.

## Now it's up and running - what next?

If you're working on this as part of a Turing project, then you'll have some cards in your Pivotal Tracker "Icebox." Otherwise, here are some things we'd like the app to have in the future:

- The winner of a vote persists and faces off against a new contender 
- Users can choose a specific language for the solutions they see
- At the moment, users can access a new exercise by refreshing. Ideally if the first couple of items happen, it should be possible to have a button to request a new solution and skip the current pair.
# Just do it

Just do it is an todo app that allows users to keep track of their tasks. It is
written using Ruby on Rails. The authentication system is provided by
(Devise)[http://devise.plataformatec.com.br] and the main test framework is
(Rspec)[http://rspec.info/]. It is deployed in Heroku and you can see it
(here)[https://dashboard.heroku.com/apps/polar-lowlands-60626].

Follow the instructions bellow to get Just do it app in your local environment.

## Requirements

Before start, make sure you have the following tools installed:

* ruby 2.4.2
* rails >= 5.2.0
* PostgreSQL

## Setting up

First, get the application code:

```
git clone https://gitlab.com/bahartmann/just-do-it.git`
```

```
cd just-do-it
```

Now, install the required gems:
```
bundle
```

And create the database and set the schema:
```
rake db:create db:migrate
```

## Run test suite

We're using RSpec in the tests. Run he suite with:

```
bundle exec rspec
```

## Start the app

To start the application server, run:
```
rails s
```

Now, it should be possible to see the Just do it app accessing
[http://0.0.0.0:3000/](http://0.0.0.0:3000/) in your browser.

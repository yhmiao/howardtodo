# Howard Miao TODO app.

## Features

- Todos:
  - List todos and show immediate changes without refreshing.
  - Create new todo.
  - Edit and update todo.
  - Delete todo.

- User Authorization:
  - New sign up.
  - Sign in.
  - Change user password.
  - Admin:
    * List Activity logs that record all user actions.
    * Show each activity log.

## Software Framework

Rails 5.1.6 with Ruby 2.4.1

## Frontend

Coffeescript and Rails default views.

## Websocket

Action Cable with async, Redis(production)

## Database

sqlite3, MySQL(production)

## Test Framework

RSpec

## Setup

#### 1. Clone

```
git clone git@github.com:yhmiao/howardtodo.git
```

#### 2. Setup Local Environment

Install the following

Necessary:

```
Ruby      2.5.7
Rails     5.2.3
```

Necessary but versions can be different:

```
Devise
Materialize 1.0.0.rc1
```

#### 3. Setup Rails

Move to project directory:

```
bundle install
rake db:migrate
rake db:seed
rails s
```

Go to `http://localhost:3000` and you should see no error.

#### 4. Running tests

Run `rspec` and ensure all tests pass.

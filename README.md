# Howard Miao TODO app for honestbee interview.

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
Ruby      2.4.1
Rails     5.1.6
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

## Scaling and Potential Botteneck

1. Action cable might not be the best solution for scaling as it will cause more latency with more users. The alternatives would be to switch to anycable or phoenix to be used along side rails server.

2. Loading all todo records during index action may create a bottleneck. To resolve, use back-end pagination to return partial records instead of entire table.

3. The usual solution to support large scale network traffic is to use a load balancer.

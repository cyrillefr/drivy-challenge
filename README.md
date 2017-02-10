#### Assumptions:

ruby 2.3.3

bundler installed


#### Libs required:
- to run:

  none

- to test:

  rake
  
  rspec
  
  simplecov
  

All will be installed via Gemfile


#### To install:
Go to the folder of the project and type bundle install


#### To run tests:
rake or rake spec from the project root folder


#### To run:
In a terminal, from the project root folder: go to each level and run main, ie:
cd level1
run main.rb

#### Ouput:
A json formatted string that is identical to the content of the output.json file

#### Assumptions:
ruby 2.3.3
bundler installed

#### Idea
I thought the levels as rules that may apply. Depending on the levels, I add and/or override those rules thnaks to the includes of Ruby.

Main part is a rental service and a data service. Which is initiated by running a main file in a level folder with corresponding modules that load.

So for each level, a rental service is created with a set of rules and a data service which loads data.

Service rental then got data and can handle rental objects that have access to methods thanks to included modules. This module mecanism allows each level to use, override and add new functionnalities.

I use openStruct to map data into simple data class.



# Drivy Backend Challenge

 Looking for a job? Check out our [open positions](https://en.drivy.com/jobs).

## Guidelines

- clone this repo (do **not** fork it)
- solve the levels in ascending order
- commit your code at the end of each level
- once you are done, ping someone from drivy (ideally via our jobs page)

You can have a look at the higher levels, but please do the **simplest thing** that could work for the level you're currently solving.

Disclaimer: the levels become more complex over time, so you will probably have to re-use some code and adapt it to the new requirements.
A good way to solve this is by using OOP and adding new layers of abstraction only when they become necessary.
Don't hesitate to write [shameless code](http://red-badger.com/blog/2014/08/20/i-spent-3-days-with-sandi-metz-heres-what-i-learned/) at first, and then refactor it in the next levels.

For higher levels we are interested in seeing code that is:
- clean
- extensible
- robust (don't overlook edge cases, use exceptions where needed, ...)


## Things to know

- all prices are stored as integers (in cents)

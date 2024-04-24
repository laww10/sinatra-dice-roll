require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  erb(:elephant)
end

get("/howdy") do
  "Hello World"
end

get("/zebra") do
  "We must add a route for each path we want to support"
end

get("/giraffe") do
  "Hopefully this shows up without having to restart the server 🤞🏾"
end

get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die
	
  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
	erb(:twosix, {:layout => :wrapper})
end


get("/dice/2/10") do
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die
  outcome = "You rolled a #{first_die} and a #{second_die} for a sum of #{sum}"

  "<h1> 2 x 10-sided die </h1>
  <p> #{outcome}</p>"
end

get("/dice/100/6") do
  @rolls = []

  100.times do
    die = rand(1..6)

    @rolls.push(die)
  end

  erb(:onehundred_six)
end

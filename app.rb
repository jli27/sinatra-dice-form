require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:home)
end

get("/process_roll") do
  @num_dice = params.fetch("num_dice").to_i
  @sides = params.fetch("sides").to_i
  @process_roll = "/process_roll?dice=#{@num_dice}&sides=#{@sides}"

  @rolls = []

  @num_dice.times do
    die = rand(1..@sides)

    @rolls.push(die)
  end

  erb(:flexible)
end

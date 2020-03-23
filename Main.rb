#Requier section
require 'discordrb'
require 'json'

#Read credentials.json
file = File.open "credentials.json"
credentials = JSON.load file
file.close

#Read tonton.json
file = File.open "tonton.json"
tonton = JSON.load file
file.close

#Credientials use
bot = Discordrb::Bot.new token: credentials["discord-token"], client_id: credentials["client-id"]

#Functions
bot.message(with_text: 'Help!') do |event|
  event.respond '**Bienvenue dans le module aide**'
  event.respond '**Ping!**: Répond Pong!'
  event.respond '**Tonton!**: Sort une réplique des tontons flingueurs aléatoire'
  event.respond '**Meme!**: Sort un même'
end

bot.message(with_text: 'Ping!') do |event|
  event.respond 'Pong!'
end

bot.message(with_text: 'Tonton!') do |event|
  r = rand(1..tonton["0"].to_i).to_s
  event.respond tonton[r]
end
bot.message(with_text: 'Meme!') do |event|
  event.respond 'To Do'
end

bot.run
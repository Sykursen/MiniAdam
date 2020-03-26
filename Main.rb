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

#Read kaamelott.json
file = File.open "kaamelott.json"
kaamelott = JSON.load file
file.close

#Credientials use
bot = Discordrb::Bot.new token: credentials["discord-token"], client_id: credentials["client-id"]

#Functions
#Help Function
bot.message(with_text: 'Help!') do |event|
  event.respond '**Bienvenue dans le module aide**'
  event.respond '**Ping!**: Répond Pong!'
  event.respond '**Tonton!**: Sort une réplique des Tontons Flingueurs'
  event.respond '**Kaamelott!**: Sort une réplique de Kaamelott'
  event.respond '**Wtf!**: Sort une réplique aléatoire'
  event.respond '**Meme!**: Sort un même'
end

#Ping Function
bot.message(with_text: 'Ping!') do |event|
  event.respond 'Pong!'
end

#Tonton Function
bot.message(with_text: 'Tonton!') do |event|
  r = rand(1..tonton["0"].to_i).to_s
  event.respond tonton[r]
end

#Kaamelott Function
bot.message(with_text: 'Kaamelott!') do |event|
  r = rand(1..kaamelott["0"].to_i).to_s
  event.respond kaamelott[r]
end

#Wtf Function
bot.message(with_text: 'Wtf!') do |event|
  r = rand(0..2)
  case r
  when 0
    r = rand(1..tonton["0"].to_i).to_s
    event.respond '**Tontons Flingueurs** ' + tonton[r]
  when 1
    r = rand(1..kaamelott["0"].to_i).to_s
    event.respond '**Kaamelott** ' + kaamelott[r]
  when 2
    event.respond '**Bioup Bioup**'
  else
    event.respond '**ErReuR sYsteM !!!**'
  end
end

#Meme Function
bot.message(with_text: 'Meme!') do |event|
  event.respond 'To Do'
end

bot.run

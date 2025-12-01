require 'discordrb'
require 'dotenv/load'
require_relative 'lib/info_command.rb'
require_relative 'lib/dice_command.rb'
require_relative 'lib/text_command.rb'
require_relative 'lib/roll_command.rb'

# Hämta token från miljövariabel
token = ENV['DISCORD_BOT_TOKEN']

if token.nil? || token.empty?
  puts "❌ DISCORD_BOT_TOKEN är inte satt!"
  puts "Skapa en .env fil med: DISCORD_BOT_TOKEN=din_token"
  exit 1
end

# Skapa bot
bot = Discordrb::Bot.new(token: token, intents: [:server_messages])

# Skapa kommando-instanser
# Enkla textkommandon - nu med TextCommand!
hello_command = TextCommand.new(
  name: "hello",
  description: "Says hello",
  text: "Hello!"
)
ping_command = TextCommand.new(
  name: "ping",
  description: "Pings the bot",
  text: "Pong!"
)
# Bonus: Lägg till fler kommandon enkelt!
info_command = TextCommand.new(
  name: "info",
  description: "Shows bot info",
  text: "🤖 I'm a Discord bot built with Ruby and TDD!"
)
dice_command = DiceCommand.new()

# Hantera meddelanden
bot.message do |event|
  # Ignorera bot:ens egna meddelanden
  next if event.user.bot_account?
  
  content = event.content.strip

  # Dela upp i command och arguments
  parts = content.split
  command_name = parts.first&.downcase
  args = parts[1..]  # Allt efter första ordet
  #command, arg = event.content.strip.match(/^(!\w+) ?(.*)/i).captures



  # Kolla om meddelandet är ett kommando
  case command
  when "!hello"
    hello_command.execute(event)
  when "!ping"
    ping_command.execute(event)
  when "!info"
    info_command.execute(event)
  when "!dice"
    dice_command.execute(event)
  when "!roll"
    roll_command.execute(event, arg)
  end
end

# Logga när bot:en startar
bot.ready do
  puts "✅ Bot inloggad som: #{bot.profile.username}"
  puts "📡 Bot är online och lyssnar på kommandon!"
  puts "💬 Testa: !hello, !dice, !info eller !ping"
end

# Starta bot:en
puts "🚀 Startar bot..."
bot.run
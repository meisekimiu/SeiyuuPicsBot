#!/usr/bin/ruby
require_relative 'src/tweetbot/Tweetbot'
require_relative 'src/parameter_parser/ParameterParser'
require_relative 'src/MainConfiguration'
require 'twitter'

def main
  config_file = PositionalParameter.new(:config_file,1)
  config_file.setDescription('the path to the bot\'s JSON configuration file')
  config_file.makeRequired
  help_flag = FlagParameter.new(:help)
  help_flag.setDescription('shows this help message')
  help_flag.addIdentifier('--help')
  help_flag.addIdentifier('-h')

  parser = ParameterParser.new
  parser.add(config_file)
  parser.add(help_flag)
  appstate = parser.parse(ARGV)
  if appstate.help or !appstate.valid
	usage(parser.getParameters)
	exit
  end

  bot = Tweetbot.new(appstate.config_file)
  authkeys = bot.authkeys
  client = Twitter::REST::Client.new { |config|
	config.consumer_key = authkeys.consumer.key
	config.consumer_secret = authkeys.consumer.secret
	config.access_token = authkeys.access.key
	config.access_token_secret = authkeys.access.secret
  }
  tweet = bot.getTweet
  client.update_with_media(tweet.status,tweet.file)
  File.open(bot.directory+'/backlog.log','w') { |file| file.write(bot.getBacklogOutput)}
end

main
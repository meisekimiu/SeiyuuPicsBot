require 'json'
require_relative 'ImageSelector'
class Tweetbot
  def initialize(path)
    if File.file?(path)
      bot_data = JSON.parse(File.read(path), object_class: OpenStruct)
      @name = bot_data.name
      setup_directory(bot_data, path)
      setup_authkeys(bot_data)
	  @selector = ImageSelector.new(@directory,bot_data.statuses.to_h)
    end
  end

  def setup_directory(bot_data, path)
    if Dir.exists?(bot_data.image_directory)
      @directory = bot_data.image_directory
    else
      @directory = File.expand_path(File.dirname(path)+'/'+bot_data.image_directory)
    end
  end

  def setup_authkeys(bot_data)
    @authkeys = OpenStruct.new
    @authkeys.consumer = OpenStruct.new
    @authkeys.access = OpenStruct.new
    @authkeys.consumer.key = bot_data.consumer_key
    @authkeys.consumer.secret = bot_data.consumer_secret
    @authkeys.access.key = bot_data.access_key
    @authkeys.access.secret = bot_data.access_secret
  end

  def name
    @name
  end

  def authkeys
    @authkeys
  end

  def directory
    @directory
  end

  def getTweet
	@selector.getTweet
  end

  def getBacklogOutput
	@selector.backlog.join("\n")
  end
end
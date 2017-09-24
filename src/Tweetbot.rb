require 'json'
class Tweetbot
  def initialize(path)
    if File.file?(path)
      bot_data = JSON.parse(File.read(path), object_class: OpenStruct)
      @name = bot_data.name
      setup_authkeys(bot_data)
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
end
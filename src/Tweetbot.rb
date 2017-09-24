require 'json'
class Tweetbot
  def initialize(path)
    if File.file?(path)
      bot_data = JSON.parse(File.read(path), object_class: OpenStruct)
      @name = bot_data.name
    end
  end

  def name
    return @name
  end
end
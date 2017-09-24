require 'rspec'
require_relative '../src/Tweetbot'
describe Tweetbot do
  before :each do
    @bot = Tweetbot.new (File.expand_path(File.dirname(__FILE__))+"/TestBot.json")
  end

  describe '#new' do
    it 'should be creatable' do
      expect(@bot).to be_an_instance_of Tweetbot
    end
  end

  describe '#name' do
    it 'should get the bot name from configuration' do
      expect(@bot.name).to eq "TestBot"
    end
  end
end
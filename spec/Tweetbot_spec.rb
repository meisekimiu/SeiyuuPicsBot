require 'rspec'
require_relative '../src/Tweetbot'
describe Tweetbot do
  before :each do
    @bot = Tweetbot.new (File.expand_path(File.dirname(__FILE__))+'/TestBot.json')
  end

  describe '#new' do
    it 'should be creatable' do
      expect(@bot).to be_an_instance_of Tweetbot
    end
  end

  describe '#name' do
    it 'should get the bot name from configuration' do
      expect(@bot.name).to eq 'TestBot'
    end
  end

  describe '#authkeys' do
    it 'should return all the authorization keys in one object' do
      expect(@bot.authkeys.consumer.key).to eq 'CONSUMER_KEY_TEST123'
      expect(@bot.authkeys.consumer.secret).to eq 'CONSUMER_SECRET_TEST123'
      expect(@bot.authkeys.access.key).to eq 'ACCESS_KEY_123'
      expect(@bot.authkeys.access.secret).to eq 'ACCESS_SECRET_123'
    end
  end

  describe '#directory' do
    it 'should get the full image directory' do
      expect(@bot.directory).to eq (File.expand_path(File.dirname(__FILE__))+'/testbot_imgs')
    end
  end

  describe '#getTweet' do
	it 'should get a tweet with proper configuration' do
	  arr = [@bot.getTweet,@bot.getTweet]
	  expect(arr.collect {|tweet| tweet.status}).to include('Relax!')
	  expect(arr.collect {|tweet| tweet.status}).to include('RELAX RELAX!')
	end
  end
end
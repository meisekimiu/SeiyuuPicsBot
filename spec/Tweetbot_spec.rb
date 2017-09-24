require 'rspec'
require_relative '../src/Tweetbot'
describe Tweetbot do

  it 'should be creatable' do
    bot = Tweetbot.new
  end
end
require 'rspec'
require_relative '../src/Tweet'
describe Tweet do
  before :each do
	@tweet = Tweet.new("Relax!",File.expand_path(File.dirname(__FILE__))+"/testbot_imgs/leona_relax.png")
  end

  describe "#new" do
	it 'should be creatable' do
	  expect(@tweet).to be_an_instance_of Tweet
	end
  end

  describe '#status' do
	it 'should return status' do
	  expect(@tweet.status).to eq "Relax!"
	end
  end
end
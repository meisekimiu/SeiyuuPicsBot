require 'rspec'
require_relative '../src/Tweet'
describe Tweet do

  describe "#new" do
	it 'should be creatable' do
	  Tweet.new("Relax!",File.expand_path(File.dirname(__FILE__))+"/testbot_imgs/leona_relax.png")
	end
  end
end
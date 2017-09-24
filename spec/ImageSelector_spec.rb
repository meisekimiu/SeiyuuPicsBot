require 'rspec'
require_relative '../src/ImageSelector'
describe ImageSelector do
  describe '#new' do
    it 'should be creatable' do
      img = ImageSelector.new(File.expand_path(File.dirname(__FILE__))+"/TestBot.json",
                              {    "default"=> "Relax!",
								   "leona_relax_2.png"=> "RELAX RELAX!"})
    end
  end
end
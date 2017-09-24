require 'rspec'
require_relative '../src/ImageSelector'
describe ImageSelector do
  before :each do
    @img = ImageSelector.new(File.expand_path(File.dirname(__FILE__))+"/testbot_imgs",
                            {    "default"=> "Relax!",
                                 "leona_relax_2.png"=> "RELAX RELAX!"})
  end

  describe '#new' do
    it 'should be creatable' do
      expect(@img).to be_an_instance_of ImageSelector
    end
  end

  describe '#select' do
	it "selects an image" do
      expect(@img.select[0..10]).to eq "leona_relax"
	end
  end
end
require 'rspec'
require_relative '../src/tweetbot/ImageSelector'
describe ImageSelector do
  before :each do
    @img = ImageSelector.new(File.expand_path(File.dirname(__FILE__))+'/testbot_imgs',
                            {    'default'=> 'Relax!',
                                 'leona_relax_2.png'=> 'RELAX RELAX!'})
  end

  describe '#new' do
    it 'should be creatable' do
      expect(@img).to be_an_instance_of ImageSelector
    end
  end

  describe '#select' do
	it 'selects an image' do
      expect(@img.select[0..10]).to eq 'leona_relax'
	end
	it 'honors backlog' do
      file1 = @img.select
      file2 = @img.select
	  file3 = @img.select
	  expect(file1).to_not eq file2
	  expect(file1).to eq file3
	end
  end

  describe '#backlog' do
	it 'maintains backlog' do
	  expect(@img.backlog).to_not include('leona_relax.png')
      expect(@img.backlog).to_not include('leona_relax_2.png')
	  @img.select
      expect(@img.backlog[0][0..10]).to eq 'leona_relax'
	end
	it 'gets backlog from backlog.log file' do
	  expect(@img.backlog).to include('not_a_real_file.png')
	end
  end

  describe '#getTweet' do
	it 'gets data for a Tweet' do
	  arr = [@img.getTweet,@img.getTweet]
	  expect(arr.collect {|tweet| tweet.status}).to include('Relax!')
	  expect(arr.collect {|tweet| tweet.status}).to include('RELAX RELAX!')
	end
  end
end
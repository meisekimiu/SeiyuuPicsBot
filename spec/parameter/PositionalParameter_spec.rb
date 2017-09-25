require 'rspec'
require_relative '../../src/parameter_parser/PositionalParameter'
describe PositionalParameter do
  before :each do
	@param = PositionalParameter.new(:input,1)
  end

  describe 'new' do
	it 'should be creatable' do
	  expect(@param).to be_an_instance_of PositionalParameter
	end
  end

  describe 'parse' do
	it 'should parse arguments' do
	  expect(@param.getValue).to be false
	  @param.parse(['config.json','--help'])
	  expect(@param.getValue).to eq 'config.json'
	end
  end

  describe 'returnParams' do
	it 'should resent the arguments untouched' do
	  expect(@param.returnParams(['config.json'])).to include('config.json')
	end
  end
end
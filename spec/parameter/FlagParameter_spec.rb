require 'rspec'
require_relative '../../src/parameter_parser/FlagParameter'
describe FlagParameter do
  before :each do
	@param = FlagParameter.new(:help)
	@param.addIdentifier('--help')
  end

  describe 'new' do
	it 'should be creatable' do
	  expect(@param).to be_an_instance_of FlagParameter
	end
  end

  describe 'parser' do
	it 'should be false if identifier is not passed in' do
	  @param.parse(['config.json'])
	  expect(@param.getValue).to be false
	end
	it 'should be true if identifier is passed in as argument' do
	  @param.parse(['--help'])
	  expect(@param.getValue).to be true
	end
  end

  describe 'returnParameters' do
	it 'should return a list of other parameters' do
	  param_return_params = @param.returnParams(['--help', 'config.json'])
	  expect(param_return_params).to_not include('--help')
	  expect(param_return_params).to include('config.json')
	end
  end
end
require 'rspec'
require_relative '../../src/parameter_parser/KeyValueParameter'
describe KeyValueParameter do
  before :each do
	@param = KeyValueParameter.new(:input_file)
	@param.addIdentifier('-i')
  end

  describe 'new' do
    it 'should be creatable' do
      expect(@param).to be_an_instance_of KeyValueParameter
    end
  end

  describe 'parse' do
	it 'should be false if identifier is not passed in' do
	  @param.parse(['config.json'])
	  expect(@param.getValue).to be false
	end
	it 'should be correct value if identifier is passed in as argument' do
	  @param.parse(['-i','config.json','--help'])
	  expect(@param.getValue).to eq 'config.json'
	end
	it 'should raise an error if there is no specified input' do
	  expect{@param.parse(['config.json','-i'])}.to raise_error(KeyValueParameter::UndefinedValueError)
	end
  end

  describe 'returnParameters' do
	it 'should return a list of other parameters' do
	  param_return_params = @param.returnParams(['-i', 'config.json', '--help'])
	  expect(param_return_params).to_not include('-i')
	  expect(param_return_params).to_not include('config.json')
	  expect(param_return_params).to include('--help')
	end
  end
end
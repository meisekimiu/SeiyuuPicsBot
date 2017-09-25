require 'rspec'
require_relative '../../src/parameter_parser/Parameter'
describe Parameter do
  before :each do
	@param = Parameter.new
  end

  describe '#new' do
	it 'should be creatable' do
	  expect(@param).to be_an_instance_of (Parameter)
	end
  end

  describe '#setSymbol #getSymbol' do
	it 'should have a symbol' do
	  @param.setSymbol(:help)
	  expect(@param.getSymbol).to eq :help
	end
  end

  describe '#makeRequired #makeOptional #isRequired' do
	it 'starts optional, and can then be made required or optional' do
	  expect(@param.isRequired).to be false
	  @param.makeRequired
	  expect(@param.isRequired).to be true
	  @param.makeOptional
	  expect(@param.isRequired).to be false
	end
  end

  describe '#getValue #setValue' do
	it 'can have its value set and get' do
	  expect(@param.getValue).to be false
	  @param.setValue(true)
	  expect(@param.getValue).to be true
	end
  end
end
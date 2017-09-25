require 'rspec'
require_relative '../../src/parameter_parser/NamedParameter'
describe NamedParameter do
  before :each do
	@param = NamedParameter.new(:help)
  end
  describe '#new' do
  	it 'should be creatable' do
	  expect(@param).to be_an_instance_of NamedParameter
	  expect(@param.hasName).to be true
  	end
  end
  describe '#addIdentifier #getIdentifiers' do
	it 'should be able to add an identifier name' do
	  @param.addIdentifier('--help')
	  expect(@param.getIdentifiers).to include('--help')
	end
  end
end
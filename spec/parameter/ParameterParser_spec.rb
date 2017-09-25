require 'rspec'
require_relative '../../src/parameter_parser/ParameterParser'
describe ParameterParser do
  before :each do
	@parser = ParameterParser.new
	@positional = PositionalParameter.new(:input_file,1)
	@positional.makeRequired
	@flag = FlagParameter.new(:help)
	@flag.addIdentifier('--help')
	@keyvalue = KeyValueParameter.new(:message)
	@keyvalue.addIdentifier('-m')
  end

  describe '#new' do
	it 'should be creatable' do
	  expect(@parser).to be_an_instance_of ParameterParser
	end
  end

  describe '#add' do
	it 'should be able to add parameters' do
	  @parser.add(@positional)
	end
  end

  describe '#parse' do
	it 'should be able to return app state' do
	  @parser.add(@positional)
	  @parser.add(@flag)
	  @parser.add(@keyvalue)
	  state = @parser.parse(["-m","Hi there","potato.jpg"])
	  expect(state.message).to eq "Hi there"
	  expect(state.input_file).to eq "potato.jpg"
	  expect(state.valid).to be true
	end
	it 'returns an invalid state if an error is thrown' do
	  @parser.add(@keyvalue)
	  state = @parser.parse(["-m"])
	  expect(state.valid).to be false
	end
	it 'returns an invalid state if a required param is absent' do
	  @parser.add(@flag)
	  @parser.add(@positional)
	  state = @parser.parse(["--help"])
	  expect(state.valid).to be false
	  state = @parser.parse(["--help","oy"])
	  expect(state.valid).to be true
	end
  end

  describe '#getParameters' do
	it 'should get parameters' do
	  @parser.add(@flag)
	  expect(@parser.getParameters).to include(@flag)
	end
  end
end
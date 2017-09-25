require_relative 'PositionalParameter'
require_relative 'FlagParameter'
require_relative 'KeyValueParameter'
class ParameterParser
  def initialize
	@parameters = []
  end

  def add(parameter)
	if parameter.hasName
	  @parameters.unshift(parameter)
	else
	  @parameters.push(parameter)
	end
  end

  def parse(args)
	state = OpenStruct.new
	state.valid = true
	remaining_arguments = args
	@parameters.each do |param|
	  parse_param_to_state(param, remaining_arguments, state)
	  remaining_arguments = param.returnParams(remaining_arguments)
	end
	state
  end

  def parse_param_to_state(param, remaining_arguments, state)
	begin
	  param.parse(remaining_arguments)
	rescue
	  state.valid = false
	end
	state.valid = false if param.isRequired and !param.getValue
	state[param.getSymbol] = param.getValue
  end
end
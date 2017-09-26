require_relative 'parameter_parser/KeyValueParameter'
def usage(defined_parameters)
  STDERR.puts "usage: #{$PROGRAM_NAME} [options] config_file"
  positional_parameters = defined_parameters.reverse.reject { |param| param.hasName }
  named_parameters = defined_parameters.reverse - positional_parameters
  positional_parameters.each do |param|
	descriptor = "  #{param.getSymbol.to_s}:\t#{param.getDescription}"
	STDERR.puts descriptor
  end
  STDERR.puts ''
  STDERR.puts 'Options:'
  named_parameters.each do |param|
	descriptor = "  #{param.getIdentifiers.join(', ')}"
	if param.is_a?(KeyValueParameter)
	  descriptor += ' <val>'
	end
	descriptor += "\t#{param.getDescription}"
	STDERR.puts descriptor
  end
  STDERR.puts ''
  STDERR.puts 'See the `config.default.json` file included with the source for a basic config template.'
  exit
end
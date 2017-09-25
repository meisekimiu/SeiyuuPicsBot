require_relative 'parameter_parser/KeyValueParameter'
def usage(defined_parameters)
  STDERR.puts "usage: #{$PROGRAM_NAME} [options] config_file"
  defined_parameters.reverse.each do |param|
	descriptor = "  #{param.isNamed ? param.getSymbol.to_s : param.getIdentifiers.join(', ')}"
	if descriptior.is_a?(KeyValueParameter)
	  descriptor += ' <val>'
	end
	descriptor += "\t#{param.getDescription}"
	STDERR.puts descriptor
  end
  STDERR.puts ''
  STDERR.puts 'See the `config.default.json` file included with the source for a basic config template.'
  exit
end
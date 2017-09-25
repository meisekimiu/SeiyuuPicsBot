def usage
  STDERR.puts "usage: #{$PROGRAM_NAME} [options] config_file"
  STDERR.puts "\tconfig_file: The JSON formatted bot configuration."
  STDERR.puts ""
  STDERR.puts "See the `config.default.json` file included with the source for a basic config template."
  exit
end
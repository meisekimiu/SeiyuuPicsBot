require_relative 'NamedParameter'
class FlagParameter < NamedParameter
  def parse(args)
	args.each do |arg|
	  if @identifiers.include? arg
		setValue(true)
	  end
	end
  end

  def returnParams(args)
	args.reject { |arg| @identifiers.include? arg }
  end
end
require_relative 'NamedParameter'
class KeyValueParameter < NamedParameter
  class UndefinedValueError < RuntimeError
  end

  def parse(args)
	is_expecting_value = false
	args.each do |arg|
	  if @identifiers.include? arg
		is_expecting_value = true
		next
	  end
	  if is_expecting_value
		setValue(arg)
		is_expecting_value = false
	  end
	end
	raise UndefinedValueError if is_expecting_value
  end

  def returnParams(args)
	is_expecting_value = false
	new_args = []
	args.each do |arg|
	  if @identifiers.include?(arg) || is_expecting_value
		is_expecting_value = !is_expecting_value
		next
	  end
	  new_args.push(arg)
	end
	new_args
  end
end
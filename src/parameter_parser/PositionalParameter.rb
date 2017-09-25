require_relative 'Parameter'
class PositionalParameter < Parameter
  def initialize(symbol,position)
	super()
	@symbol = symbol
	@position = position
  end

  def hasName
	false
  end

  def parse(args)
	setValue(args[@position-1])
  end

  def returnParams(args)
	args
  end
end
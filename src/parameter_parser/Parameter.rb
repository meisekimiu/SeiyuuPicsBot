class Parameter
  def initialize
	@symbol = nil
	@required = false
	@value = false
	@description = ""
  end

  def setSymbol(symbol)
	@symbol = symbol
  end

  def getSymbol()
	@symbol
  end

  def makeRequired()
	@required = true
  end

  def makeOptional()
	@required = false
  end

  def isRequired()
	@required
  end

  def setValue(value)
	@value = value
  end

  def getValue
	@value
  end

  def setDescription(desc)
	@description = desc
  end

  def getDescription
	@description
  end
end
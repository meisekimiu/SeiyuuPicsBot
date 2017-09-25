require_relative 'Parameter'
class NamedParameter < Parameter
  def initialize(symbol)
	super()
	@symbol = symbol
	@named = true
	@identifiers = []
  end

  def hasName
	true
  end

  def addIdentifier(identifier)
	@identifiers.push identifier
  end

  def getIdentifiers
	@identifiers
  end
end
class Tweet
  def initialize(status,mediapath)
	@status = status
	@mediapath = mediapath
  end

  def status
	@status
  end

  def file
	File.new(@mediapath)
  end
end
class ImageSelector
  def initialize(directory,statusdata)
	@directory = directory
  end

  def select
	files = Dir.entries(@directory) - ['.','..','backlog.log']
	return files.sample
  end
end
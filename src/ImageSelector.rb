class ImageSelector
  def initialize(directory,statusdata)
	@directory = directory
	@backlog = File.readlines(directory+"/backlog.log")
	@file_list = (Dir.entries(@directory) - ['.', '..', 'backlog.log'])
  end

  def select
	files = @file_list - @backlog
	selected = files.sample
	add_to_backlog(selected)
	selected
  end

  def add_to_backlog(selected)
	backlog.push selected
	if backlog.length > @file_list.length/2
	  backlog.shift
	end
  end

  def backlog
	@backlog
  end
end
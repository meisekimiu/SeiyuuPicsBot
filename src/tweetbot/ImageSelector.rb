require_relative 'Tweet'
class ImageSelector
  def initialize(directory,statusdata)
	@directory = directory
	setup_backlog
	@file_list = (Dir.entries(@directory) - ['.', '..', 'backlog.log'])
	@status_data = Hash[statusdata.map{ |k, v| [k.to_s, v] }] #Stringifies any keys in the hash
  end

  def setup_backlog
	File.write(@directory+'/backlog.log', '') unless File.exists?(@directory+'/backlog.log')
	@backlog = File.readlines(@directory+'/backlog.log')
	@backlog.collect! do |file|
		file.chomp
	end
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

  def getTweet
	file = select
	status = getStatus(file)
	Tweet.new(status,@directory+'/'+file)
  end

  def getStatus(file)
	if @status_data.has_key?(file)
	  return @status_data[file]
	elsif @status_data.has_key?('default')
	  return @status_data['default']
	end
	''
  end
end

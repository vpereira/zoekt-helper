class NoCodeStreamFound < StandardError
	def initialize(codestream)
		super("codestream #{codestream} not found")
	end
end


class ZoektIndex
	attr_accessor :procs, :file_limit, :ignore_dirs

	SRC = File.join(ENV["HOME"],"sources")
	IDXDIR = File.join(ENV["HOME"],".zoekt")

	def initialize(codestream, procs = 2, directory=SRC, idxdir=IDXDIR)
		@codestream = codestream
		@procs = procs
		@directory = directory
		@idxdir = idxdir
		@ignore_dirs = ".git,.hg,.svn,.osc"
		@file_limit = 10_000_000 # 10 Mb
		
	end

	def run
		raise NoCodeStreamFound.new(@codestream) unless File.directory?(File.join(@directory,@codestream))
		FileUtils.cd(File.join(@directory,@codestream))
		::Cheetah.run("zoekt-index","-index",@idxdir,"-ignore_dirs",@ignore_dirs,"-parallelism",@procs,"-file_limit",@file_limit,".",stdout: :capture)
	end
end

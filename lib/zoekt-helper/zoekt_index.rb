class NoCodeStreamFound < StandardError
	def initialize(codestream)
		super("codestream #{codestream} not found")
	end
end


class ZoektIndex
	attr_accessor :procs, :file_limit, :ignore_dirs

	SRC = File.join(ENV["HOME"],"sources")

	def initialize(codestream, procs = 2)
		@codestream = codestream
		@procs = procs
		@ignore_dirs = ".git,.hg,.svn,.osc"
		@file_limit = 10_000_000 # 10 Mb
	end

	def run
		raise NoCodeStreamFound.new(@codestream) unless File.directory?(File.join(SRC,@codestream))
		FileUtils.cd(File.join(SRC,@codestream))
		::Cheetah.run("zoekt-index","-ignore_dirs",@ignore_dirs,"-parallelism",@procs,"-file_limit",@file_limit,".",stdout: :capture)
	end
end

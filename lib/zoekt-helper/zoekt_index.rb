class NoCodeStreamFound < StandardError
	def initialize(codestream)
		super("codestream #{codestream} not found")
	end
end


class ZoektIndex
	attr_accessor :procs, :file_limit

	SRC = "/root/sources"

	def initialize(codestream)
		@codestream = codestream
		@procs = 2
		@file_limit = 10_000_000 # 10 Mb
	end

	def run
		raise NoCodeStreamFound.new(@codestream) unless File.directory?(File.join(SRC,@codestream))
		FileUtils.cd(File.join(SRC,@codestream)) 		
		puts ::Cheetah.run("zoekt-index","-parallelism",@procs,"-file_limit",@file_limit,".",stdout: :capture)
	end
end


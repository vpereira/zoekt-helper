class OSC
	attr_accessor :codestream, :package

	SRC = File.join(ENV["HOME"],"sources")

	def initialize(codestream, package)
		@codestream = codestream
		@package = package
		@spec = "#{@package}.spec"
		raise Errno::ENOENT, "osc not initialized, please configure it first" unless File.exists? File.join(ENV["HOME"],".oscrc")

		FileUtils.cd(SRC)
	end

	def update
		execute(["up","#{@codestream}/#{@package}"])
	end

	def checkout
		execute(["co",@codestream,@package])
	end

	def remote_exist?
		execute(["ls",@codestream,@package])
	end

	def local_exist?
		File.directory?(File.join(SRC,@codestream,@package))
	end

	def go_to_root
		FileUtils.cd(SRC)
	end

	def go_to_code
		FileUtils.cd(File.join(SRC,@codestream,@package))
	end

	def quilt
		begin
			::Cheetah.run("quilt","setup", @spec, stdout: :capture)
		rescue Cheetah::ExecutionFailed
		end
	end

	def self.list_packages 
		FileUtils.cd(SRC)
		Dir.glob("*/**")
	end


	private
	def execute(args)
		::Cheetah.run("osc","-A", "https://api.suse.de", *args, stdout: :capture)
	end

end

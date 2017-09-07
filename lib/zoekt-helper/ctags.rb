class Ctags
  class NoCodeStreamFound < StandardError
  	def initialize(codestream)
  		super("codestream #{codestream} not found")
  	end
  end


  class ZoektIndex

  	SRC = File.join(ENV["HOME"],"sources")

  	def initialize(codestream, procs = 2)
  		@codestream = codestream
  	end

  	def run
  		raise NoCodeStreamFound.new(@codestream) unless File.directory?(File.join(SRC,@codestream))
  		FileUtils.cd(SRC)
      File.open("ctags.json","w") do |f|
  		 f.write Cheetah.run("universal-ctags","--recurse=yes","--fields=*","--output-format=json", ".",stdout: :capture)
      end
  	end
  end
end

class OSC
  attr_accessor :codestream, :package
  # default path
  SRC = File.join(ENV['HOME'], 'sources')

  def initialize(codestream, package, directory = SRC)
    @codestream = codestream
    @package = package
    @spec = "#{@package}.spec"
    # configure your osc first
    unless File.exist? File.join(ENV['HOME'], '.oscrc')
      raise Errno::ENOENT, 'osc not initialized, please configure it first'
    end
    @directory = directory

    FileUtils.cd(@directory)
  end

  def delete
    FileUtils.rm_r("#{@codestream}/#{@package}", secure: true) if local_exist?
  end

  def update
    execute(['up', "#{@codestream}/#{@package}"])
  end

  def checkout
    execute(['co', @codestream, @package])
  end

  def remote_exist?
    execute(['ls', @codestream, @package])
  end

  def local_exist?
    File.directory?(File.join(@directory, @codestream, @package))
  end

  def go_to_root
    FileUtils.cd(@directory)
  end

  def go_to_code
    FileUtils.cd(File.join(@directory, @codestream, @package))
  end

  def quilt
    ::Cheetah.run('quilt', 'setup', @spec, stdout: :capture)
    # rescue Cheetah::ExecutionFailed
  end

  def self.list_packages
    FileUtils.cd(@directory)
    Dir.glob('*/**')
  end

  private

  def execute(args)
    ::Cheetah.run('osc', '-A', 'https://api.suse.de', *args, stdout: :capture)
  end
end

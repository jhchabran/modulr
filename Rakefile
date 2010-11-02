require 'bundler'
Bundler::GemHelper.install_tasks
require 'modulr'


COMMONJS_SPEC_DIR = File.join('vendor', 'commonjs', 'tests', 'modules', '1.0')

desc "Concatenate example file"
task :build_example do
  File.open(File.join('output', 'example.js'), 'w') do |f|
    f << Modulr.ize(File.join('example', 'program.js'))
  end
end

desc "Concatenate synchronous example file"
task :build_sync_example do
  File.open(File.join('output', 'example.js'), 'w') do |f|
    f << Modulr.ize(File.join('example', 'program.js'), { :global => 'foo' })
  end
end

desc "Run CommonJS Module 1.0 specs"
task :spec do
  specs = ENV["SPECS"] || "**"
  FileList["#{COMMONJS_SPEC_DIR}/{#{specs}}/program.js"].each do |spec|
    dir = File.dirname(spec)
    output = File.join(dir, 'output.js')
    input = File.join(dir, 'input.js')
    system = File.join(dir, 'system.js')
    FileUtils.touch(system)
    begin
      puts File.basename(dir).center(80, "_")
      File.open(input, 'w') { |f| f << "require('program');" }
      File.open(output, 'w') { |f| f << Modulr.ize(input) }
      system("js -f #{output}")
    rescue => e
      phase = e.is_a?(Modulr::ModulrError) ? "building" : "running"
      puts "ERROR while #{phase} (#{e.class}):"
      puts e.message
    ensure
      FileUtils.rm(output)
      FileUtils.rm(input)
      FileUtils.rm(system)
      puts
      puts
    end
  end
end

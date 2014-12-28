=begin
Rakefile used to install dot files into home directory.
  from cdzombak/dotfiles
  edited to fit my setup
=end

require 'rake'
require 'erb'

desc "install the dot files into user's home directory"
task :install do
  replace_all = false
  Dir['topic/**/*'].each do |file|
    next unless file =~ /symlink/
    
    filename = File.basename(file).sub('.symlink', '').sub('.erb', '')
    if File.exist?(File.join(ENV['HOME'], ".#{filename}"))
      if File.identical? file, File.join(ENV['HOME'], ".#{filename}")
        puts "identical ~/.#{filename}"
      elsif replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{filename}? [yNaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{filename}"
        end
      end
    else
      link_file(file)
    end
  end
end

def replace_file(file)
  puts "replacing file #{file}"
  system %Q{rm -rf "$HOME/.#{File.basename(file).sub('.erb', '').sub('.symlink', '')}"}
  link_file(file)
end

def link_file(file)
  filename = File.basename(file).sub('.symlink', '').sub('.erb', '')
  if file =~ /.erb$/
    puts "generating .#{filename}"
    File.open(File.join(ENV['HOME'], ".#{filename}"), 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    puts "linking ~/.#{file}"
    system %Q{ln -s "$PWD/#{file}" "$HOME/.#{File.basename(file).sub('.symlink', '')}"}
  end
end

#!/usr/bin/env ruby
require 'find'

class SlimCleaner
  def slim2erbfinal
    if system "slim2html.sh"
      replace
    end
  end

  def replace
    # slim_file_paths = []
    Find.find('.') do |path|
      # slim_file_paths << path if path =~ /.*\.slim$/
      if path =~ /.*\.erb$/
        puts path
        text = File.read(path)
        replace = text.gsub(/::Temple::Utils\.escape_html\({2}(.*?)\){2}/m, '\1')
        File.open(path, "w") { |file| file.puts replace }
      end
    end
  end


  if __FILE__ == $0


    su=SlimCleaner.new
    su.slim2erbfinal
  end
end
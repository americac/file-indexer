#!/usr/bin/env ruby
require_relative 'file_indexer'

def verify_input(input=nil)
  if input.empty?
    puts "Hey! At least one file needs to be passed as a argument:"
    puts "./index_files.rb file_name_1 file_name_2"
    puts
    false
  else
    true
  end
end

if $0 == __FILE__
  if verify_input(ARGV)
    ARGV.each do |input_file|
      fi = FileIndexer.new(input_file)
      fi.read_file_data
      fi.sort_by_count
      fi.display_results
      puts
    end
  end
end

#!/usr/bin/env ruby

def read_file_data(input_file=nil)
  raise "Input file is empty." if File.zero?(input_file.to_s)
  word_hash = Hash.new
  word_hash
end

def verify_input_file(input_file=nil)
  raise "Input file is required." if input_file.nil?
end


input_file = ARGV[0] ? ARGV[0] : nil


verify_input_file(input_file)
word_hash = read_file_data(input_file)

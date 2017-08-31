#!/usr/bin/env ruby

def verify_input_file(input_file=nil)
  raise "Input file is required." if input_file.nil?
  raise "Input file is empty." if File.zero?(input_file.to_s)
end

input_file = ARGV[0] ? ARGV[0] : nil
verify_input_file(input_file)

#!/usr/bin/env ruby

def display_results(results=nil, file_name=nil)
  limit = 10
  raise "Nothing to display." if results.nil?

  print_string = "Top #{limit} words"
  print_string = file_name.nil? ? print_string+" are:" : print_string+" for #{file_name} are:"
  puts print_string

  limit.times do
    word = results.pop
    puts "#{word.first} -> #{word.last}"
  end
end

def sort_by_count(hash=nil)
  raise "Nothing to sort." if hash.nil?
  sorted_hash = hash.sort{|a,b| a[1]<=>b[1]}
end

def read_file_data(input_file=nil)
  raise "Input file is empty." if File.zero?(input_file.to_s)
  word_hash = Hash.new
  File.readlines(input_file).each do |line|
    words = line.split(/\W+/)
    next if words.empty?
    words.each do |word|
      next if word == ''
      if word_hash.key?(word)
	word_hash[word] += 1
      else
	word_hash[word] = 1
      end
    end
  end
  word_hash
end

def verify_input(input=nil)
  raise "At least one input file is required." if input.nil?
  true
end

if $0 == __FILE__
  if verify_input(ARGV)
    ARGV.each do |input_file|
      word_hash = read_file_data(input_file)
      word_array = sort_by_count(word_hash)
      display_results(word_array,input_file)
    end
  end
end

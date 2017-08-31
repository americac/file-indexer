#!/usr/bin/env ruby

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

def verify_input_file(input_file=nil)
  raise "Input file is required." if input_file.nil?
end

if $0 == __FILE__
  Limit = 10
  input_file = ARGV[0] ? ARGV[0] : nil

  verify_input_file(input_file)
  word_hash = read_file_data(input_file)
  word_array = sort_by_count(word_hash)

  puts "Top #{Limit} words for #{input_file} are: "
  Limit.times do
    word = word_array.pop
    puts "#{word.first} -> #{word.last}"
  end
end

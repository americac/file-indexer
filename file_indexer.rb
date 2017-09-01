class FileIndexer
  attr_accessor :results, :word_hash

  def initialize(input_file)
    @input_file = input_file
    @word_hash = read_file_data || nil
    @results = sort_by_count || nil
  end

  def display_results
    return false if @results.nil?
    limit = @results.length < 10 ? @results.length : 10

    puts "Top #{limit} words for #{@input_file} are:"

    limit.times do
      word = @results.pop
      puts "#{word.first} -> #{word.last}"
    end
  end

  def sort_by_count
    return false if @word_hash.nil?
    sorted_hash = @word_hash.sort{|a,b| a[1]<=>b[1]}
  end

  def read_file_data
    if File.zero?(@input_file.to_s)
      puts "WARNING: #{@input_file} is empty and will not be processed."
      false
    else
      word_hash = Hash.new
      File.readlines(@input_file).each do |line|
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
    end
    word_hash
  end
end

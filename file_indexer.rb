class FileIndexer
  attr_accessor :results, :word_hash

  def initialize(input_file)
    @input_file = input_file
    @word_hash = file_data
    @results = Array.new
    @default_limit = 10
  end

  def top_results(limit = @default_limit)
    return false if @results.empty?
    limit = @default_limit unless limit.is_a?(Integer)
    limit = @results.length < limit ? @results.length : limit
    @results[0..limit -1]
  end

  def display_top_results(limit = @default_limit)
    if @word_hash
      sort_results
      my_results = top_results(limit)
      my_results ? print_top_results(my_results) : false
    else
      false
    end
  end

  def print_top_results(results)
    puts "Top #{results.length} words for #{@input_file} are:"
    results.each do |word, count|
      puts "#{word} -> #{count}"
    end
  end

  def sort_results
    return false unless @word_hash
    @results = @word_hash.sort{|b,a| a[1]<=>b[1]}
  end

  def file_data
    if File.zero?(@input_file.to_s)
      false
    elsif @word_hash
      @word_hash
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
      word_hash
    end
  end
end

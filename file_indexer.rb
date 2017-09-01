class FileIndexer
  attr_accessor :results, :word_hash

  def initialize(input_file)
    @input_file = input_file
    @word_hash = Hash.new
    @results = Array.new
    @default_limit = 10
  end

  def get_top_results(limit = nil)
    file_data
    if file_data
      sort_results
      display_results(limit)
    else
      false
    end
  end

  def display_results(limit = @default_limit)
    return false if @results.empty?
    limit = @default_limit unless limit.is_a?(Integer)
    limit = @results.length < limit ? @results.length : limit

    puts "Top #{limit} words for #{@input_file} are:"

    limit.times do
      word = @results.pop
      puts "#{word.first} -> #{word.last}"
    end
  end

  def sort_results
    return false if @word_hash.empty?
    @results = @word_hash.sort{|a,b| a[1]<=>b[1]}
  end

  def file_data
    if File.zero?(@input_file.to_s)
      false
    else
      File.readlines(@input_file).each do |line|
	words = line.split(/\W+/)
	next if words.empty?
	words.each do |word|
	  next if word == ''
	  if @word_hash.key?(word)
	    @word_hash[word] += 1
	  else
	    @word_hash[word] = 1
	  end
	end
      end
      @word_hash
    end
  end
end

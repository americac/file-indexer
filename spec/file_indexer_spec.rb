require_relative "../file_indexer"
describe "File Indexer" do
  let(:text_file_1) { "test_files/FannyLambert.txt" }
  let(:text_file_2) { "test_files/TestWords.txt" }
  let(:empty_text_file) { "test_files/EmptyFile.txt" }

  describe "#verify_input" do
    it "returns false if no input file provided" do
      expect(verify_input([])).to eq false
    end
    it "returns true if input file provided" do
      expect(verify_input([text_file_1])).to be true
    end
  end

  describe "#read_file_data" do
    it "returns a data hash" do
      expect(read_file_data(text_file_1)).to be_a(Hash)
    end

    it "hash should contain data" do
      expect(read_file_data(text_file_1)).not_to be_empty
    end

    it "should not break up words" do
      word_hash = read_file_data(text_file_2)
      expect(word_hash.key?("don't")).to be true
    end
  end

  describe "#sort_by_count" do
    it "returns false if file is empty" do
      expect(sort_by_count()).to be false
    end

    it "returns a data hash" do
      word_hash = read_file_data(text_file_1)

      expect(sort_by_count(word_hash)).to be_a(Array)
    end

    it "sorted array should be same size as original" do
      word_hash = read_file_data(text_file_1)
      sorted_array = sort_by_count(word_hash)

      expect(sorted_array.length).to eq(word_hash.keys.count)
    end
  end

  describe "#display_results" do
    it "prints 10 results if results are 10 or more" do
      sample_array = Array.new
      %w(toes my for scared I'm cold get will it and coming is winter ).each_with_index do |string, index|
	sample_array << [string, index]
      end
      expect( display_results(sample_array)).to eq(10)
    end

    it "prints 5 results if only 5 results" do
      sample_array = Array.new
      %w(files funny of case in ).each_with_index do |string, index|
	sample_array << [string, index]
      end
      expect( display_results(sample_array)).to eq(5)
    end
  end
end

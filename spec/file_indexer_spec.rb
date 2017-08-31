require_relative "../file_indexer"
describe "File Indexer" do
  let(:text_file_1) { "test_files/FannyLambert.txt" }
  let(:text_file_2) { "test_files/Aventures.txt" }
  let(:text_file_3) { "test_files/LaMediaNoche.txt" }
  let(:empty_text_file) { "test_files/EmptyFile.txt" }

  describe "#verify_input" do
    it "does not raise error if input file provided" do
      expect{verify_input([text_file_1])}.not_to raise_error
    end

    it "can accept multiple files" do
      expect{verify_input([text_file_1, text_file_2, text_file_3])}.not_to raise_error
    end
  end

  describe "#read_file_data" do
    it "returns a data hash" do
      expect(read_file_data(text_file_1)).to be_a(Hash)
    end

    it "hash should contain data" do
      expect(read_file_data(text_file_1)).not_to be_empty
    end
  end

  describe "#sort_by_count" do
    it "returns a data hash" do
      word_hash = read_file_data(text_file_1)

      expect(sort_by_count(word_hash)).to be_a(Array)
    end

    it "sorted hash should be same size as original" do
      word_hash = read_file_data(text_file_1)
      sorted_array = sort_by_count(word_hash)

      expect(sorted_array.length).to eq(word_hash.keys.count)
    end
  end

  describe "#display_results" do
    it "raises error if nothing is passed" do
      expect{display_results()}.to raise_error(RuntimeError)
    end

    it "prints 10 results" do
      sample_array = Array.new
      %w(toes my for scared I'm cold get will it and coming is winter ).each_with_index do |string, index|
	sample_array << [string, index]
      end
      expect( display_results(sample_array)).to eq(10)
    end
  end
end

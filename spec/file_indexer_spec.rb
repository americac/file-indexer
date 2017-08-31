require_relative "../file_indexer"
describe "File Indexer" do
  let(:text_file_1) { "test_files/FannyLambert.txt" }
  let(:empty_text_file) { "test_files/EmptyFile.txt" }

  describe "#verify_input_file" do
    it "raises error if no argument set"do
      expect{verify_input_file()}.to raise_error(RuntimeError)
    end

    it "does not raise error if input file provided" do
      expect{verify_input_file(text_file_1)}.not_to raise_error
    end
  end

  describe "#read_file_data" do
    it "raises error if file is empty"do
      expect{read_file_data(empty_text_file)}.to raise_error(RuntimeError)
    end

    it "returns a data hash" do
      expect(read_file_data(text_file_1)).to be_a(Hash)
    end

    it "hash should contain data" do
      expect(read_file_data(text_file_1)).not_to be_empty
    end
  end

  describe "#sort_by_count" do
    it "raises error if hash not passed"do
      expect{sort_by_count()}.to raise_error(RuntimeError)
    end

    it "returns a data hash" do
      word_hash = read_file_data(text_file_1)

      expect(sort_by_count(word_hash)).to be_a(Hash)
    end

  end
end

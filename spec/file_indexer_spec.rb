require_relative "../file_indexer"
describe FileIndexer do
  let(:text_file_1) { "test_files/FannyLambert.txt" }
  let(:funny_file) { "test_files/FunnyFile.txt" }
  let(:empty_text_file) { "test_files/EmptyFile.txt" }

  describe "#read_file_data" do
    it "returns a data hash" do
      fi = FileIndexer.new(text_file_1)

      expect(fi.read_file_data).to be_a(Hash)
    end

    it "hash should contain data" do
      fi = FileIndexer.new(text_file_1)

      expect(fi.read_file_data).not_to be_empty
    end

    it "should not have none word characters as words" do
      fi = FileIndexer.new(text_file_1)

      expect(fi.read_file_data.key?(":")).to be false
    end

    it "should warn empty file will not be processed" do
      expect{FileIndexer.new(empty_text_file)}.to output("WARNING: #{empty_text_file} is empty and will not be processed.\n").to_stdout

    end
  end

  describe "#sort_by_count" do
    it "returns an array" do
      fi = FileIndexer.new(text_file_1)

      expect(fi.sort_by_count).to be_a(Array)
    end

    it "sorted array should be same size as original" do
      fi = FileIndexer.new(text_file_1)

      expect(fi.results.length).to eq(fi.word_hash.keys.count)
    end
  end

  describe "#display_results" do
    it "prints 10 results if results are 10 or more" do
      fi = FileIndexer.new(text_file_1)
      expect( fi.display_results).to eq(10)
    end

    it "prints 5 results if only 8 results" do
      fi = FileIndexer.new(funny_file)
      expect( fi.display_results).to eq(8)
    end
  end
end

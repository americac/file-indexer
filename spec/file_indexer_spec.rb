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
      expect{FileIndexer.new(empty_text_file).read_file_data}.to output("WARNING: #{empty_text_file} is empty and will not be processed.\n").to_stdout

    end
  end

  describe "#sort_results" do
    it "returns an array" do
      fi = FileIndexer.new(text_file_1)

      expect(fi.sort_results).to be_a(Array)
    end

    it "sorted array should be same size as original" do
      fi = FileIndexer.new(text_file_1)
      fi.read_file_data
      fi.sort_results

      expect(fi.results.length).to eq(fi.word_hash.keys.count)
    end
  end

  describe "#display_results" do
    it "prints default 10 results if results are greater than 10 and limit not passed" do
      fi = FileIndexer.new(text_file_1)
      fi.read_file_data
      fi.sort_results

      expect( fi.display_results).to eq(10)
    end

    it "prints less than default results if no limit set and results are less than default" do
      fi = FileIndexer.new(funny_file)
      fi.read_file_data
      fi.sort_results

      expect( fi.display_results).to eq(8)
    end

    it "prints results for limit set" do
      fi = FileIndexer.new(text_file_1)
      fi.read_file_data
      fi.sort_results

      expect( fi.display_results(12)).to eq(12)
    end
  end
end

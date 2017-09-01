require_relative "../index_files"
describe "index_files.rb" do
  let(:text_file_1) { "test_files/FannyLambert.txt" }
  let(:empty_file) { "test_files/EmptyFile.txt" }

  describe "#read_file_data" do
    it "displays usage if no arguments are passed" do
      expect{verify_input([])}.to output("Hey! At least one file needs to be passed as a argument:\n./index_files.rb file_name_1 file_name_2\n\n").to_stdout

    end

    it "returns false if no arguments are passed" do
      expect(verify_input([])).to be false
    end

    it "returns true if argument is passed" do
      expect(verify_input([text_file_1])).to be true
    end
  end
end

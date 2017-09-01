require_relative "../index_files"
describe "index_files.rb" do
  let(:text_file_1) { "test_files/FannyLambert.txt" }
  let(:funny_file) { "test_files/FunnyFile.txt" }
  let(:empty_text_file) { "test_files/EmptyFile.txt" }

  describe "#read_file_data" do
    it "displays usage if no arguments are passed" do
      expect{verify_input([])}.to output("Hey! At least one file needs to be passed as a argument:\n./index_files.rb file_name_1 file_name_2\n\n").to_stdout

    end
  end
end

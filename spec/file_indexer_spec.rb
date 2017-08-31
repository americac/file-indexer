require_relative "../file_indexer"
describe "#verify_input_file" do
  it "raises error if no argument set"do
    expect{verify_input_file()}.to raise_error(RuntimeError)
  end
end

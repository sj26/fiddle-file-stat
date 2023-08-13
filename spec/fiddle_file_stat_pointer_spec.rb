require "rspec"
require "fiddle-file-stat"

RSpec.describe File::Stat do
  it "has a pointer" do
    file = __FILE__

    expected_stat = File.stat(file)

    # TODO: how to initialize an empty stat struct?
    actual_stat = File::Stat.new(".")
    actual_stat_ptr = actual_stat.to_ptr

    libc = Fiddle.dlopen(nil)
    libc_stat = Fiddle::Function.new(libc["stat"], [:voidp, :voidp], :int)
    expect(libc_stat.call(file, actual_stat)).to eq(0)

    expect(actual_stat).to eq(expected_stat)
  end
end

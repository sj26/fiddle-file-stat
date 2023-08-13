# Fiddle File::Stat

Wraps Ruby's `File::Stat` with a `Fiddle::Pointer` so you can pass it into C
libraries.

## Installation

Add this line to your application's Gemfile:

    gem "fiddle-file-stat"

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fiddle-file-stat

## Usage

```ruby
require "fiddle"
require "fiddle-file-stat"

stat = File::Stat.new("/")

# This is the root directory's stat
stat

libc = Fiddle.dlopen(nil)
libc_stat = Fiddle::Function.new(libc["stat"], [:voidp, :voidp], :int)

# stat will be cast to a Fiddle::Pointer and populated within C
libc_stat.call(".", stat)

# This is now the current directory's stat
stat
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Ensure all tests pass (`rake test`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request

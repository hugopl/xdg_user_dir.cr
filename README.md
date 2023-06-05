# XDG User Dir

This is a thin wrapper around `xdg_user_dir_lookup` C function from
[xdg-user-dirs](https://www.freedesktop.org/wiki/Software/xdg-user-dirs/), the C code is linked statically and has no
dependencies.

This is useful if you don't want to spawn a new process just to fetch some value from `xdg-user-dir` program.

Maybe in the future I could port the C code to Crystal and let this be pure Crystal, a PR with spec tests are welcome.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     xdg_user_dir:
       github: hugopl/xdg_user_dir.cr
   ```

2. Run `shards install`

## Usage

```crystal
require "xdg_user_dir"

# You can query the default locations in a type safe way
XdgUserDir.lookup(:documents) #=> "/home/joe/Documents"

# Or using a string to access custom locations
XdgUserDir.lookup("MUSIC") #=> "/home/joe/Music"
```

## Contributing

1. Fork it (<https://github.com/hugopl/xdg_user_dir.cr/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Hugo Parente Lima](https://github.com/hugopl) - creator and maintainer

# zig-leven

Measure the difference between two slices using the Levenshtein distance algorithm

Adapted from https://github.com/sindresorhus/leven

## Built With
- Zig master
    - https://github.com/ziglang/zig
- Zigmod package manager
    - https://github.com/nektro/zigmod

## Install
```
zigmod aq add 1/nektro/leven
```

## Usage
`pub fn leven(comptime T: type, alloc: *std.mem.Allocator, a: []const T, b: []const T, max: ?usize) !usize`

## Future
TODO Unicode support for strings

## License
MIT

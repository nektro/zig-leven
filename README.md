# zig-leven

![loc](https://sloc.xyz/github/nektro/zig-leven)
[![license](https://img.shields.io/github/license/nektro/zig-leven.svg)](https://github.com/nektro/zig-leven/blob/master/LICENSE)
[![nektro @ github sponsors](https://img.shields.io/badge/sponsors-nektro-purple?logo=github)](https://github.com/sponsors/nektro)
[![Zig](https://img.shields.io/badge/Zig-0.14-f7a41d)](https://ziglang.org/)
[![Zigmod](https://img.shields.io/badge/Zigmod-latest-f7a41d)](https://github.com/nektro/zigmod)

Measure the difference between two slices using the Levenshtein distance algorithm

Adapted from https://github.com/sindresorhus/leven

## Usage

`pub fn leven(comptime T: type, alloc: *std.mem.Allocator, a: []const T, b: []const T, max: ?usize) !usize`

## Future

TODO Unicode support for strings

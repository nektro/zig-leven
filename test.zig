const std = @import("std");
const leven = @import("leven").leven;
const expect = @import("expect").expect;

test {
    const alloc = std.testing.allocator;
    try expect(try leven(u8, alloc, "a", "b", 20)).toEqual(1);
    try expect(try leven(u8, alloc, "ab", "ac", 20)).toEqual(1);
    try expect(try leven(u8, alloc, "ac", "bc", 20)).toEqual(1);
    try expect(try leven(u8, alloc, "abc", "axc", 20)).toEqual(1);
    try expect(try leven(u8, alloc, "kitten", "sitting", 20)).toEqual(3);
    try expect(try leven(u8, alloc, "xabxcdxxefxgx", "1ab2cd34ef5g6", 20)).toEqual(6);
    try expect(try leven(u8, alloc, "cat", "cow", 20)).toEqual(2);
    try expect(try leven(u8, alloc, "xabxcdxxefxgx", "abcdefg", 20)).toEqual(6);
    try expect(try leven(u8, alloc, "javawasneat", "scalaisgreat", 20)).toEqual(7);
    try expect(try leven(u8, alloc, "example", "samples", 20)).toEqual(3);
    try expect(try leven(u8, alloc, "sturgeon", "urgently", 20)).toEqual(6);
    try expect(try leven(u8, alloc, "levenshtein", "frankenstein", 20)).toEqual(6);
    try expect(try leven(u8, alloc, "distance", "difference", 20)).toEqual(5);
    // try expect(try leven(u8, alloc, "因為我是中國人所以我會說中文", "因為我是英國人所以我會說英文", 20)).toEqual(2);
}

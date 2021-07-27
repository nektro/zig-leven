const std = @import("std");
const leven = @import("leven").leven;

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const alloc = &gpa.allocator;

    try std.testing.expectEqual(@as(usize, 1), try leven(u8, alloc, "a", "b"));
    try std.testing.expectEqual(@as(usize, 1), try leven(u8, alloc, "ab", "ac"));
    try std.testing.expectEqual(@as(usize, 1), try leven(u8, alloc, "ac", "bc"));
    try std.testing.expectEqual(@as(usize, 1), try leven(u8, alloc, "abc", "axc"));
    try std.testing.expectEqual(@as(usize, 3), try leven(u8, alloc, "kitten", "sitting"));
    try std.testing.expectEqual(@as(usize, 6), try leven(u8, alloc, "xabxcdxxefxgx", "1ab2cd34ef5g6"));
    try std.testing.expectEqual(@as(usize, 2), try leven(u8, alloc, "cat", "cow"));
    try std.testing.expectEqual(@as(usize, 6), try leven(u8, alloc, "xabxcdxxefxgx", "abcdefg"));
    try std.testing.expectEqual(@as(usize, 7), try leven(u8, alloc, "javawasneat", "scalaisgreat"));
    try std.testing.expectEqual(@as(usize, 3), try leven(u8, alloc, "example", "samples"));
    try std.testing.expectEqual(@as(usize, 6), try leven(u8, alloc, "sturgeon", "urgently"));
    try std.testing.expectEqual(@as(usize, 6), try leven(u8, alloc, "levenshtein", "frankenstein"));
    try std.testing.expectEqual(@as(usize, 5), try leven(u8, alloc, "distance", "difference"));
    try std.testing.expectEqual(@as(usize, 2), try leven(u8, alloc, "因為我是中國人所以我會說中文", "因為我是英國人所以我會說英文"));
}

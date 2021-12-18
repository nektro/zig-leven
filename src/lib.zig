const std = @import("std");
const range = @import("range").range;

// // the naïve recursive implementation
// pub fn leven(comptime T: type, a: []const T, b: []const T) usize {
//     if (b.len == 0) return a.len;
//     if (a.len == 0) return b.len;

//     if (a[0] == b[0]) return leven(T, a[1..], b[1..]);

//     return 1 + std.math.min3(
//         leven(T, a[1..], b),
//         leven(T, a, b[1..]),
//         leven(T, a[1..], b[1..]),
//     );
// }

pub fn leven(comptime T: type, alloc: std.mem.Allocator, a: []const T, b: []const T, max: ?usize) !usize {
    if (std.mem.eql(T, a, b)) return 0;

    var left = a;
    var right = b;

    if (left.len > right.len) {
        left = b;
        right = a;
    }

    var ll = left.len;
    var rl = right.len;

    if (max != null and rl - ll >= max.?) {
        return max.?;
    }

    {
        const sl = suffixLen(T, a, b);
        ll -= sl;
        rl -= sl;
    }

    const start = prefixLen(T, a, b);
    ll -= start;
    rl -= start;

    if (ll == 0) return rl;

    var result: usize = 0;

    const charCodeCache = try alloc.alloc(T, ll);
    defer alloc.free(charCodeCache);

    const array = try alloc.alloc(usize, ll);
    defer alloc.free(array);

    for (range(ll)) |_, i| {
        charCodeCache[i] = left[start + i];
        array[i] = i + 1;
    }

    for (range(rl)) |_, j| {
        const bCharCode = right[start + j];
        var temp = j;
        result = j + 1;

        for (range(ll)) |_, i| {
            const temp2 = if (bCharCode == charCodeCache[i]) temp else temp + 1;
            temp = array[i];
            array[i] = if (temp > result) (if (temp2 > result) result + 1 else temp2) else (if (temp2 > temp) temp + 1 else temp2);
            result = array[i];
        }
    }

    if (max != null and result >= max.?) return max.?;
    return result;
}

fn prefixLen(comptime T: type, a: []const T, b: []const T) usize {
    if (a.len == 0 or b.len == 0) return 0;
    var i: usize = 0;
    while (a[i] == b[i]) : (i += 1) {}
    return i;
}

fn suffixLen(comptime T: type, a: []const T, b: []const T) usize {
    if (a.len == 0 or b.len == 0) return 0;
    var i: usize = 0;
    while (a[a.len - 1 - i] == b[b.len - 1 - i]) : (i += 1) {}
    return i;
}

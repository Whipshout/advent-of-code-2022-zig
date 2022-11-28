const std = @import("std");
const Allocator = std.mem.Allocator;
const List = std.ArrayList;
const Map = std.AutoHashMap;
const StrMap = std.StringHashMap;
const BitSet = std.DynamicBitSet;

const util = @import("util.zig");
const gpa = util.gpa;

const data = @embedFile("../inputs/01.txt");

pub fn main() !void {
    print("***** Problem One *****\n", .{});
    print("Result: {d}\n", .{try problem1()});

    print("***** Problem Two *****\n", .{});
    print("Result: {d}\n", .{try problem2()});
}

fn problem1() !u32 {
    var lines = tokenize(u8, data, "\r\n");

    var previous_depth: u32 = undefined;
    previous_depth = try parseInt(u32, lines.next().?, 10);

    var increases: u32 = 0;

    while (lines.next()) |line| {
        var current_depth = try parseInt(u32, line, 10);
        if (current_depth > previous_depth) increases += 1;
        previous_depth = current_depth;
    }

    return increases;
}

fn problem2() !u32 {
    var lines = tokenize(u8, data, "\r\n");

    var nums = List(u32).init(gpa);
    defer nums.deinit();

    while (lines.next()) |line| {
        try nums.append(try parseInt(u32, line, 10));
    }

    var increases: u32 = 0;
    var i: u32 = 0;

    while (i <= nums.items.len - 4) : (i += 1) {
        if (nums.items[i] < nums.items[i + 3]) increases += 1;
    }

    return increases;
}

// Useful stdlib functions
const tokenize = std.mem.tokenize;
const split = std.mem.split;
const indexOf = std.mem.indexOfScalar;
const indexOfAny = std.mem.indexOfAny;
const indexOfStr = std.mem.indexOfPosLinear;
const lastIndexOf = std.mem.lastIndexOfScalar;
const lastIndexOfAny = std.mem.lastIndexOfAny;
const lastIndexOfStr = std.mem.lastIndexOfLinear;
const trim = std.mem.trim;
const sliceMin = std.mem.min;
const sliceMax = std.mem.max;

const parseInt = std.fmt.parseInt;
const parseFloat = std.fmt.parseFloat;

const min = std.math.min;
const min3 = std.math.min3;
const max = std.math.max;
const max3 = std.math.max3;

const print = std.debug.print;
const assert = std.debug.assert;

const sort = std.sort.sort;
const asc = std.sort.asc;
const desc = std.sort.desc;

// Generated from template/template.zig.
// Run `zig build generate` to update.
// Only unmodified days will be updated.

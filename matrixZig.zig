const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();

    const matriz: [3][3]i32 = .{
    .{1, 2, 3},
    .{4, 5, 6},
    .{7, 8, 9},
    };

    for (matriz) |linha| {
        for (linha) |valor| {
            try stdout.print("{} ", .{valor});
        }
        try stdout.print("\n\n", .{});
    }
}

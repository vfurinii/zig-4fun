const std = @import("std");

pub fn calculateMinimumHP(allocator: *std.mem.Allocator, dungeon: [][]i32) !i32 {
    const m = dungeon.len;
    const n = dungeon[0].len;

    // Allocate memory for dp (array of pointers to arrays of i32)
    var dp = try allocator.alloc([]i32, m);
    defer {
        // Free each row
        for (dp) |row| {
            allocator.free(row);
        }
        allocator.free(dp);
    }

    // Initialize each row with `n` columns
    for (dp, 0..) |*row_ptr, i| {
        const row = try allocator.alloc(i32, n);
        row_ptr.* = row;
        for (row, 0..) |*val, _| {
            val.* = 0;
        }
    }

    // Bottom-right cell
    dp[m - 1][n - 1] = @max(1, 1 - dungeon[m - 1][n - 1]);

    // Last column
    var i: usize = m - 2;
    while (true) {
        dp[i][n - 1] = @max(1, dp[i + 1][n - 1] - dungeon[i][n - 1]);
        if (i == 0) break;
        i -= 1;
    }

    // Last row
    var j: usize = n - 2;
    while (true) {
        dp[m - 1][j] = @max(1, dp[m - 1][j + 1] - dungeon[m - 1][j]);
        if (j == 0) break;
        j -= 1;
    }

    // Fill the rest of the matrix
    var ii: usize = m - 2;
    while (true) {
        var jj: usize = n - 2;
        while (true) {
            const minHPOnExit = @min(dp[ii + 1][jj], dp[ii][jj + 1]);
            dp[ii][jj] = @max(1, minHPOnExit - dungeon[ii][jj]);
            if (jj == 0) break;
            jj -= 1;
        }
        if (ii == 0) break;
        ii -= 1;
    }

    return dp[0][0];
}

pub fn main() !void {
    const std = @import("std");
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();

    const dungeon = [][]i32{
        &[_]i32{ -2, -3, 3 },
        &[_]i32{ -5, -10, 1 },
        &[_]i32{ 10, 30, -5 },
    };

    const result = try calculateMinimumHP(allocator, dungeon);
    std.debug.print("Minimum initial health required: {}\n", .{result});
}

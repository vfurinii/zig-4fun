const std = @import("std");

pub fn main() void {
    const stdout = std.io.getStdOut().writer();
    stdout.print("Hello, World!\n", .{}) catch {};
    foo();
    foo2();
    runArray();
}

pub fn foo() void {
    const my_string: []const u8 = "Ola, Mundo!";

    const message = [_]u8{ 'h', 'e', 'l', 'l', 'o' };

    //print string
    std.debug.print("{s}\n", .{my_string});

    //print array
    std.debug.print("{s}\n", .{message});

    //print array size
    std.debug.print("{}\n", .{message.len});
}

//concat 1 string and 1 array
pub fn foo2() void {
    const my_string: []const u8 = "Ola, Mundo! ";

    const message = [_]u8{ 'h', 'e', 'l', 'l', 'o' };

    const two_strings = my_string ++ "" ++ message;

    std.debug.print("{s}\n", .{two_strings});
}

pub fn runArray() void {
    const array = [_]i32{ 10, 20, 30, 40, 50 };
    const menorValor: i32 = 0;

    // Percorre o array com índice e valor
    for (array) |valor| {
        if (valor > menorValor)
            std.debug.print(" {}\n", .{valor});
    }
}

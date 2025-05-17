const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();

    var valorTotalSomado:i32 = 0;

    const matriz: [3][3]i32 = .{
    .{23, 10, 3},
    .{13, 4, 9},
    .{7, 8, 9},
    };

    for (matriz) |linha| {
        for (linha) |valor| {
            valorTotalSomado += valor;
        }
    }
    var valorTotalPrimeiraLinhaSomado:i32 = 0;

    for (matriz[0]) |valor| {
        valorTotalPrimeiraLinhaSomado += valor;
        }
    var valorTotalPrimeiraColunaSomado:i32 = 0;

    for (matriz) |linha| {
    valorTotalPrimeiraColunaSomado += linha[0];
    }
    if(valorTotalPrimeiraLinhaSomado > valorTotalPrimeiraColunaSomado){
        try stdout.print("A soma da primeira linha eh maior que a soma da primeira coluna\n", .{});
    } else if(valorTotalPrimeiraLinhaSomado < valorTotalPrimeiraColunaSomado){
        try stdout.print("A soma da primeira linha eh menor que a soma da primeira coluna\n", .{});
    } else {
        try stdout.print("A soma da primeira linha eh igual a soma da primeira coluna\n", .{});
    }
    //try stdout.print("total 1 linha somado: {} ", .{valorTotalPrimeiraLinhaSomado});
    //try stdout.print("\n", .{});
    //try stdout.print("total 1 coluna somado: {} ", .{valorTotalPrimeiraColunaSomado});
}

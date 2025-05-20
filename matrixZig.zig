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
    var valorTotalSegundaLinhaSomado:i32 = 0;
    var valorTotalTerceiraLinhaSomado:i32 = 0;
    var valorTotalPrimeiraColunaSomado:i32 = 0;
    var valorTotalSegundaColunaSomado:i32 = 0;
    var valorTotalTerceiraColunaSomado:i32 = 0;

    for (matriz[0]) |valor| {
        valorTotalPrimeiraLinhaSomado += valor;
    }

    for (matriz[1]) |valor| {
        valorTotalSegundaLinhaSomado += valor;
    }
    for (matriz[2]) |valor| {
        valorTotalTerceiraLinhaSomado += valor;
    }

    for (matriz) |linha| {
        valorTotalPrimeiraColunaSomado += linha[0];
    }

    for (matriz) |linha| {
        valorTotalSegundaColunaSomado += linha[1];
    }

    for (matriz) |linha| {
        valorTotalTerceiraColunaSomado += linha[2];
    }

    try stdout.print("total 1 linha somado: {} ", .{valorTotalPrimeiraLinhaSomado});
    try stdout.print("\n", .{});
    try stdout.print("total 2 linha somado: {} ", .{valorTotalSegundaLinhaSomado});
    try stdout.print("\n", .{});
    try stdout.print("total 3 linha somado: {} ", .{valorTotalTerceiraLinhaSomado});
    try stdout.print("\n", .{});
    try stdout.print("total 1 coluna somado: {} ", .{valorTotalPrimeiraColunaSomado});
    try stdout.print("\n", .{});
    try stdout.print("total 2 coluna somado: {} ", .{valorTotalSegundaColunaSomado});
    try stdout.print("\n", .{});
    try stdout.print("total 3 coluna somado: {} ", .{valorTotalTerceiraColunaSomado});


    //if(valorTotalPrimeiraLinhaSomado > valorTotalPrimeiraColunaSomado){
    //     try stdout.print("A soma da primeira linha eh maior que a soma da primeira coluna\n", .{});
    // } else if(valorTotalPrimeiraLinhaSomado < valorTotalPrimeiraColunaSomado){
    //     try stdout.print("A soma da primeira linha eh menor que a soma da primeira coluna\n", .{});
    // } else {
    //     try stdout.print("A soma da primeira linha eh igual a soma da primeira coluna\n", .{});
    // }
    //
    // if(valorTotalSegundaLinhaSomado > valorTotalPrimeiraColunaSomado){
    //     try stdout.print("A soma da primeira linha eh maior que a soma da primeira coluna\n", .{});
    // }
    //try stdout.print("\n", .{});
    //try stdout.print("total 1 coluna somado: {} ", .{valorTotalPrimeiraColunaSomado});
}

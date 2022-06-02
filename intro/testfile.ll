; Modular design
; LLVM optimizer provides users with different passes
; Each pass has a compiled object file. Object files of different passes are archived into a library. The passes within the library are not strongly connected. LLVM PassManager tracks the dependency among passes

define i32 @test1(i32 %A){
    %B = add i32 %A, 0
    ret i32 %B
}

define internal i32 @test(i32 %X, i32 %dead) {
    ret i32 %X
}

define i32 @caller() {
    %A = call i32 @test(i32 123, i32 456)
    ret i32 %A
}
`testfile.ll`
shows how LLVM optimizer optimizes code through different passes. Each pass has a compiled object file. The dependency among passes is tracked by LLVM PassManager. 

`multiply.c`
shows how to convert C source code to LLVM IR. C code is broken into a token stream during lexing, which is fed to a parser. The parser builds up an AST according to the grammar of the language. From the AST, we perform semantics analysis before generating LLVM IR code. 

`multiply.ll`
shows how to convert LLVM IR to C source code by promoting memory to register *mem2reg*. C code is broken into a token stream during lexing, which is fed to a parser. The parser builds up an AST according to the grammar of the language. From the AST, we perform semantics analysis before generating LLVM IR code. 

`test.ll`
shows how to convert LLVM IR to LLVM bitcode. The LLVM bit code file format has two aspects: a bitstream container format and an encoding of LLVM IR into the container format. 
- The container format wraps the bitcode file with a header that specifies the offset and the size of the embedded bitcode file.
- The encoding depends on two concepts: blocks and records. A block has a unique ID, representing a region of the bitstream, such as a function body. A record consists of a record code and an integer value, describing the entities within the file, such as instructions, type descriptions, global variable descriptors. 

`test.bc`
bitcode can also be converted back to IR through disassembler.

`twice.c` and `test2.c`
show how to link different bitcode files and execute the bitcode using `lli`. 

*DragonEgg* is a gcc plugin that allows gcc to use LLVM optimizer and code generation instead.
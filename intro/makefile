# LLVM optimizer
combine: testfile.ll
	opt -S -instcombine testfile.ll -o output1.ll

eliminate: testfile.ll
	opt -S -deadargelim testfile.ll -o output2.ll

view-combine: output1.ll
	cat output1.ll

view-eliminate: output2.ll
	cat output2.ll

clean-opt-ex:
	rm output*

# C to LLVM IR
c-to-llvm:
	clang -Xclang -disable-O0-optnone -emit-llvm -S multiply.c -o multiply.ll

view-llvm-as: multiply.ll
	cat multiply.ll


# IR to LLVM bitcode
ir-to-bitcode: test.ll
	llvm-as test.ll -o test.bc

view-bitcode: test.bc
	hexdump -C test.bc

bc-to-machine-as: test.bc
	llc test.bc -o test.s
# 	clang -S test.bc -o test.s -fomit-frame-pointer

bc-to-ir: test.bc
	llvm-dis test.bc -o test-gen.ll

view-gen-ir: test-gen.ll
	cat test-gen.ll

view-mas: test.s
	cat test.s

mem2reg: multiply.ll
	opt -mem2reg -S multiply.ll -o multiply2.ll

view-mem2reg: multiply2.ll
	cat multiply2.ll

link-bitcode: twice.c test2.c
	clang -Xclang -disable-O0-optnone -emit-llvm -S twice.c -o twice.ll
	clang -Xclang -disable-O0-optnone -emit-llvm -S test2.c -o test2.ll
	llvm-as twice.ll -o twice.bc
	llvm-as test2.ll -o test2.bc
	llvm-link twice.bc test2.bc -S -o output.bc
	
run-bitcode: output.bc
	lli output.bc
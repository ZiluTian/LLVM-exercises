	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 12, 0
	.globl	_mult                           ## -- Begin function mult
	.p2align	4, 0x90
_mult:                                  ## @mult
	.cfi_startproc
## %bb.0:
	movl	%edi, %eax
	imull	%esi, %eax
	retq
	.cfi_endproc
                                        ## -- End function
.subsections_via_symbols

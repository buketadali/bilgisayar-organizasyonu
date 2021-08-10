.data
X: .word 0x7FFFFFFF
Y: .word -16
ms_sum: .word 0
ls_sum: .word 0 
bitsum: .word
mask: .word 0x1
test: .word
.text

__start:and test, X, mask # strip off appropriate multiplier bit
	beqz test, shift # skip addition if multiplier is zero
	add ms_sum, ms_sum, Y # add partial sum
shift: 	and bitsum, ms_sum, 1 # determine lsb of ms_sum X ve Y nin carpim programi
	or ls_sum, ls_sum, bitsum # place lsb of ms_sum in lsb of ls_sum
	ror ls_sum, ls_sum, 1 # shift ls_sum, moving new bit into msb
	sra ms_sum, ms_sum, 1 # shift ms_sum, maintaining sign
	sll mask, mask, 1 # update index
	bnez mask, __start # branch if not last iteration
	done

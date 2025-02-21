.section .data
array: .long 1, 2, 3, 4, 5  # Array of integers
size: .long 5               # Size of the array

.section .text
.globl _start

_start:
    movl $0, %eax           # Sum accumulator (EAX)
    movl $0, %ecx           # Index (ECX)
    movl size, %ebx         # Load size of array into EBX

loop:
    cmpl %ebx, %ecx         # Compare index with array size
    jge end                 # If index >= size, jump to end

    movl array(, %ecx, 4), %edx  # Load array[i] into EDX
    addl %edx, %eax              # Add EDX to sum (EAX)
    incl %ecx                    # Increment index
    jmp loop                     # Repeat

end:
    movl %eax, %edi         # Move sum to EDI (exit code)
    movl $60, %eax          # syscall: exit
    syscall


.section __TEXT,__text
.globl _main

_main:
    # macOS x86-64 calling convention
    # rdi = first argument, rsi = second, rdx = third, rcx = fourth
    # Return value in rax

    # write(1, msg, len)
    mov $0x2000004, %rax        # write syscall number (0x2000004 on macOS)
    mov $1, %rdi                # file descriptor: stdout
    lea msg(%rip), %rsi         # pointer to message
    mov $14, %rdx               # length of message
    syscall

    # exit(0)
    mov $0x2000001, %rax        # exit syscall number
    mov $0, %rdi                # exit code
    syscall

.section __DATA,__data
msg:
    .ascii "Hello, World!\n"

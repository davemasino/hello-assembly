.section __TEXT,__text
.globl _main

_main:
    # Test: verify string content
    lea msg(%rip), %rsi
    
    # Check each character individually
    # Position 0: 'H' (0x48)
    cmpb $0x48, 0(%rsi)
    jne test_fail
    
    # Position 1: 'e' (0x65)
    cmpb $0x65, 1(%rsi)
    jne test_fail
    
    # Position 2: 'l' (0x6c)
    cmpb $0x6c, 2(%rsi)
    jne test_fail
    
    # Position 3: 'l' (0x6c)
    cmpb $0x6c, 3(%rsi)
    jne test_fail
    
    # Position 4: 'o' (0x6f)
    cmpb $0x6f, 4(%rsi)
    jne test_fail
    
    # Position 5: ',' (0x2c)
    cmpb $0x2c, 5(%rsi)
    jne test_fail
    
    # Position 6: ' ' (0x20)
    cmpb $0x20, 6(%rsi)
    jne test_fail
    
    # Position 7: 'W' (0x57)
    cmpb $0x57, 7(%rsi)
    jne test_fail
    
    # Position 8: 'o' (0x6f)
    cmpb $0x6f, 8(%rsi)
    jne test_fail
    
    # Position 9: 'r' (0x72)
    cmpb $0x72, 9(%rsi)
    jne test_fail
    
    # Position 10: 'l' (0x6c)
    cmpb $0x6c, 10(%rsi)
    jne test_fail
    
    # Position 11: 'd' (0x64)
    cmpb $0x64, 11(%rsi)
    jne test_fail
    
    # Position 12: '!' (0x21)
    cmpb $0x21, 12(%rsi)
    jne test_fail
    
    # Position 13: '\n' (0x0a)
    cmpb $0x0a, 13(%rsi)
    jne test_fail
    
    # Test passed - print success message
    mov $0x2000004, %rax        # write syscall
    mov $1, %rdi                # stdout
    lea pass_msg(%rip), %rsi
    mov $12, %rdx               # length of "Test passed\n"
    syscall
    
    # exit(0)
    mov $0x2000001, %rax
    mov $0, %rdi
    syscall

test_fail:
    # Test failed - print failure message
    mov $0x2000004, %rax        # write syscall
    mov $1, %rdi                # stdout
    lea fail_msg(%rip), %rsi
    mov $12, %rdx               # length of "Test failed\n"
    syscall
    
    # exit(1)
    mov $0x2000001, %rax
    mov $1, %rdi
    syscall

.section __DATA,__data
msg:
    .ascii "Hello, World!\n"

pass_msg:
    .ascii "Test passed\n"

fail_msg:
    .ascii "Test failed\n"

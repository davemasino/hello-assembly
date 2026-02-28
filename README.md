# hello-assembly

A simple Hello World program written in x86-64 assembly for macOS.

## Building

Assemble the program:
```bash
as hello.s -o hello.o
```

Link with clang:
```bash
clang hello.o -o hello
```

Or in one command:
```bash
as hello.s -o hello.o && clang hello.o -o hello
```

## Running

```bash
./hello
```

Output:
```
Hello, World!
```

## Testing

A test suite is included in `test.s` that verifies the string content and format.

Build and run the test:
```bash
clang -c test.s -o test.o && clang test.o -o test && ./test
```

The test checks each character of "Hello, World!\n" individually and exits with code 0 on success.

## About

This is a minimal x86-64 assembly program that demonstrates:
- x86-64 register usage (rax, rdi, rsi, rdx)
- macOS syscall numbers (write and exit)
- Basic assembly syntax and structure
- Data and text sections

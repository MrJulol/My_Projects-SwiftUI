public _start



section '.text' executable
_start:
mov rdi, af_inet
mov rsi, sock_stream
mov rdx, 0
mov rax, socket
syscall

mov r12, rax ; socket fd
mov rdi, r12
mov rsi, address
mov rdx, 16
mov rax, bind
syscall

mov rdi, r12
mov rsi, 10
mov rax, listen
syscall

accept_loop:

mov rdi, r12
mov rsi, 0
mov rdx, 0
mov rax, accept
syscall

mov r13, rax ; client socket fd
mov rdi, r13
mov rsi, buffer
mov rdx, 256
mov rax, read
syscall

mov rdi, path
mov rsi, o_rdonly
mov rax, open
syscall

mov r14, rax ; save index.html fd

mov rdi, rax
mov rsi, buffer2
mov rdx, 256
mov rax, read
syscall

mov rdi, r13
mov rsi, buffer2
mov rdx, 256
mov rax, write
syscall

mov rdi, r13
mov rax, close
syscall

mov rdi, r14
mov rax, close
syscall

jmp accept_loop

mov rdi, 0
mov rax, exit
syscall

mov rax, 0x02000001  ; System call for exit.
mov rdi, 0x0         ; An exit code of 0.
syscall

section '.data' writeable
address:
dw af_inet
dw 0x901f
dd 0
dq 0
buffer:
db 256 dup 0
buffer2:
db 256 dup 0
path:
db 'index.html', 0
socket = 97;
bind = 104
listen = 106
accept = 30
read = 3
write = 4
open = 5
exit = 1
close = 6
af_inet = 2
sock_stream = 1
o_rdonly = 0x0000

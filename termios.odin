package termios

import "core:c"
import "core:c/libc"

foreign import lib "system:c"
@(default_calling_convention = "c")
foreign lib {
    tcgetattr :: proc(fd: c.int, termios_p: ^Termios) -> c.int ---
    tcsetattr :: proc(fd: c.int, optional_actions: c.int, termios_p: ^Termios) -> c.int ---
    tcsendbreak :: proc(fd: c.int, duration: c.int) -> c.int ---
    tcdrain :: proc(fd: c.int) -> c.int ---
    tcflush :: proc(fd: c.int, queue_selector: c.int) -> c.int ---
    tcflow :: proc(fd: c.int, action: c.int) -> c.int ---
    cfmakeraw :: proc(termios_p: ^Termios) ---

    // speed/baudrate settings not implemented at this time
    // if you need them, feel free to open a PR
}

Termios :: struct {
    c_iflag: c.uint,
    c_oflag: c.uint,
    c_cflag: c.uint,
    c_lflag: c.uint,
    c_line:  c.uchar,
    c_cc:    [NCCS]c.uchar,
    speedi:  c.uint,
    speedo:  c.uint,
}

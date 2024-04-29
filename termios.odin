package termios

import "core:c"

foreign import libc "system:c"

@(default_calling_convention = "c")
foreign libc {
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

NCCS :: 19
tcflag_t :: c.uint
cc_t :: c.uchar

Termios :: struct {
    c_iflag: tcflag_t,
    c_oflag: tcflag_t,
    c_cflag: tcflag_t,
    c_lflag: tcflag_t,
    c_line:  cc_t,
    c_cc:    [NCCS]cc_t,
    speedi:  tcflag_t,
    speedo:  tcflag_t,
}

// c_cc - control chars
VINTR :: 0
VQUIT :: 1
VERASE :: 2
VKILL :: 3
VEOF :: 4
VTIME :: 5
VMIN :: 6
VSWTC :: 7
VSTART :: 8
VSTOP :: 9
VSUSP :: 10
VEOL :: 11
VREPRINT :: 12
VDISCARD :: 13
VWERASE :: 14
VLNEXT :: 15
VEOL2 :: 16

// c_iflag - input mode flags
IUCLC :: 0x0200
IXON :: 0x0400
IXOFF :: 0x1000
IMAXBEL :: 0x2000
IUTF8 :: 0x4000

// c_oflag - output mode flags
OLCUC :: 0x00002
ONLCR :: 0x00004
NLDLY :: 0x00100
NL0 :: 0x00000
NL1 :: 0x00100
CRDLY :: 0x06000
CR0 :: 0x00000
CR1 :: 0x00200
CR2 :: 0x00400
CR3 :: 0x00600
TABDLY :: 0x01800
TAB0 :: 0x00000
TAB1 :: 0x00800
TAB2 :: 0x01000
TAB3 :: 0x01800
BSDLY :: 0x02000
BS0 :: 0x00000
BS1 :: 0x02000
VTDLY :: 0x04000
VT0 :: 0x00000
VT1 :: 0x04000
FFDLY :: 0x08000
FF0 :: 0x00000
FF1 :: 0x08000

// c_cflag - control mode flags
// NOT IMPLEMENTED YET

// c_lflag
ISIG :: 0x00001
ICANON :: 0x00002
XCASE :: 0x00004
ECHO :: 0x00008
ECHOE :: 0x00010
ECHOK :: 0x00020
ECHONL :: 0x00040
NOFLSH :: 0x00080
TOSTOP :: 0x00100
ECHOCTL :: 0x00200
ECHOPRT :: 0x00400
ECHOKE :: 0x00800
FLUSHNO :: 0x01000
PENDIN :: 0x04000
IEXTEN :: 0x8000
EXTPROC :: 0x10000

// optional actions for tcsetattr()
TCSANOW :: 0
TCSADRAIN :: 1
TCSAFLUSH :: 2

// queue selection for tcflush()
TCIFLUSH :: 0
TCOFLUSH :: 1
TCIOFLUSH :: 2

// used by tcflow()
TCOOFF :: 0
TCOON :: 1
TCIOFF :: 2
TCION :: 3

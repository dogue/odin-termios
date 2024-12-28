package termios

// input flags
// comments are from the original C header
IF_IGNBRK   :: 1         // ignore break condition
IF_BRKINT   :: 2         // signal interrupt on break
IF_IGNPAR   :: 4         // ignore characters with parity errors
IF_PARMRK   :: 10        // mark partity and framing errors
IF_INPCK    :: 20        // enable input parity check
IF_ISTRIP   :: 40        // strip 8th bit off characters
IF_INLCR    :: 100       // map NL to CR on input
IF_IGNCR    :: 200       // ignore CR
IF_ICRNL    :: 400       // map CR to NL on input
IF_IUCLC    :: 1000      // map uppercase characters to lowercase on input (not in POSIX)
IF_IXON     :: 2000      // enable start/stop output control
IF_IXANY    :: 4000      // enable any character to restart output
IF_IXOFF    :: 10000     // enable start/stop input control
IF_IMAXBEL  :: 20000     // ring bell when input queue is full
IF_IUTF8    :: 40000     // input is UTF8 (not in POSIX)

// output flags
// some of these are gated by includes in termios-c_oflag.h
// I included everything because I don't know what should
// or shouldn't be here (comments are from the original source)
OF_OPOST    :: 1         // post-process output
OF_OLCUC    :: 2         // map lowercase characters to uppercase on output
OF_ONLCR    :: 4         // map NL to CR-NL on output
OF_OCRNL    :: 10        // map CT to NL on output
OF_ONOCR    :: 20        // no CR output at column 0
OF_ONLRET   :: 40        // NL performs CR function
OF_OFILL    :: 100       // use fill characters for delay
OF_OFDEL    :: 200       // fill is DEL
OF_NLDLY    :: 400       // select newline delays:
OF_NL0      :: 0         // newline type 0
OF_NL1      :: 400       // newline type 1
OF_CRDLY    :: 3000      // select carriage return delays:
OF_CR0      :: 0         // carriage return delay type 0
OF_CR1      :: 1000      // carriage return delay type 1
OF_CR2      :: 2000      // carriage return delay type 2
OF_CR3      :: 3000      // carriage return delay type 3
OF_TABDLY   :: 14000     // select horizontal tab delays:
OF_TAB0     :: 0         // horizontal tab delay type 0
OF_TAB1     :: 4000      // horizontal tab delay type 1
OF_TAB2     :: 10000     // horizontal tab delay type 2
OF_TAB3     :: 14000     // expand tabs to spaces
OF_BSDLY    :: 20000     // select backspace delays:
OF_BS0      :: 0         // backspace delay type 0
OF_BS1      :: 20000     // backspace delay type 1
OF_FFDLY    :: 100000    // select form feed delays:
OF_FF0      :: 0         // form feed delay type 0
OF_FF1      :: 100000    // form feed delay type 1
OF_VTDLY    :: 40000     // select vertical tab delays:
OF_VT0      :: 0         // vertical tab delay type 0
OF_VT1      :: 40000     // vertical tab delay type 1
OF_XTABS    :: 14000     // no comment in original header

// local mode flags
LF_ISIG     :: 1        // enable signals
LF_ICANON   :: 2        // canonical input
LF_XCASE    :: 4        // no comment in original header
LF_ECHO     :: 10       // enable echo
LF_ECHOE    :: 20       // echo erase character as error-correcting
LF_ECHOK    :: 40       // echo kill
LF_ECHONL   :: 100      // echo NL
LF_NOFLSH   :: 200      // disable flush after interrupt or quit
LF_TOSTOP   :: 400      // send SIGTTOU for background output
LF_ECHOCTL  :: 1000
LF_ECHOKE   :: 4000
LF_IEXTEN   :: 100000   // enable implementation-defined input
LF_EXTPROC  :: 200000   // no comment in original header

// control flags
// no comments in header :(
CF_CSIZE    :: 60
CF_CS5      :: 0
CF_CS6      :: 20
CF_CS7      :: 40
CF_CS8      :: 60
CF_CSTOPB   :: 100
CF_CREAD    :: 200
CF_PARENB   :: 400
CF_PARODD   :: 1000
CF_HUPCL    :: 2000
CF_CLOCAL   :: 4000

// control chars
CC_VINTR    :: 0
CC_VQUIT    :: 1
CC_VERASE   :: 2
CC_VKILL    :: 3
CC_VEOF     :: 4
CC_VTIME    :: 5
CC_VMIN     :: 6
CC_VSWTC    :: 7
CC_VSTART   :: 8
CC_VSTOP    :: 9
CC_VSUSP    :: 10
CC_VEOL     :: 11
CC_VREPRINT :: 12
CC_VDISCARD :: 13
CC_VWERASE  :: 14
CC_VLNEXT   :: 15
CC_VEOL2    :: 16

// set_attribute flags
TCSANOW     :: 0
TCSADRAIN   :: 1
TCSAFLUSH   :: 2

TCOOFF      :: 0
TCOON       :: 1
TCIOFF      :: 2
TCION       :: 3

TCIFLUSH    :: 0
TCOFLUSH    :: 1
TCIOFLUSH   :: 2

TTYDEF_IFLAG :: IF_BRKINT | IF_ISTRIP | IF_ICRNL | IF_IMAXBEL | IF_IXON | IF_IXANY
TTYDEF_OFLAG :: OF_OPOST | OF_ONLCR | OF_XTABS
TTYDEF_LFLAG :: LF_ECHO | LF_ICANON | LF_ISIG | LF_IEXTEN | LF_ECHOE | LF_ECHOKE | LF_ECHOCTL
TTYDEF_CFLAG :: CF_CREAD | CF_CS7 | CF_PARENB | CF_HUPCL
TTYDEF_SPEED :: 15 // B9600

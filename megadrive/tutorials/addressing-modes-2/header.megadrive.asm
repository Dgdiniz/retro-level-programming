//=============
// Mega Drive Header
//=============

//VECTOR TABLE - $00000000-$000000FF
seek($00)
dd $00000200 // STACK POINTER
dd $00000204 // CODE START
dd $00000200 // BUS ERROR
dd $00000200 // ADDRESS ERROR
dd $00000200 // ILLEGAL INSTRUCTION
dd $00000200 // CHK EXCEPTION
dd $00000200 // TRAPV EXCEPTION
dd $00000200 // PRIVILEGE VIOLATION
dd $00000200 // TRACE EXCEPTION
dd $00000200 // LINE 1010 EMULATOR
dd $00000200 // LINE 1111 EMULATOR
// $30-$5F IS RESERVED BY MOTOROLA
seek($60)
dd $00000200 // SPURIOUS EXCEPTION
dd $00000200 // INTERRUPT REQUEST LEVEL 1
dd $00000200 // INTERRUPT REQUEST LEVEL 2
dd $00000200 // INTERRUPT REQUEST LEVEL 3
dd $00000200 // INTERRUPT REQUEST LEVEL 4 (VDP INTERRUPT / HORIZONTAL BLANK)
dd $00000200 // INTERRUPT REQUEST LEVEL 5
dd $00000200 // INTERRUPT REQUEST LEVEL 6 (VERTICAL BLANK)
dd $00000200 // INTERRUPT REQUEST LEVEL 7
dd $00000200 // TRAP #00 EXCEPTION
dd $00000200 // TRAP #01 EXCEPTION
dd $00000200 // TRAP #02 EXCEPTION
dd $00000200 // TRAP #03 EXCEPTION
dd $00000200 // TRAP #04 EXCEPTION
dd $00000200 // TRAP #05 EXCEPTION
dd $00000200 // TRAP #06 EXCEPTION
dd $00000200 // TRAP #07 EXCEPTION
dd $00000200 // TRAP #08 EXCEPTION
dd $00000200 // TRAP #09 EXCEPTION
dd $00000200 // TRAP #10 EXCEPTION
dd $00000200 // TRAP #11 EXCEPTION
dd $00000200 // TRAP #12 EXCEPTION
dd $00000200 // TRAP #13 EXCEPTION
dd $00000200 // TRAP #14 EXCEPTION
dd $00000200 // TRAP #15 EXCEPTION
// $C0-$FF IS RESERVED BY MOTOROLA


seek($100)

// SYSTEM TYPE 
// (16 Bytes ASCII String, Use Spaces For Unused Bytes)
//
// What system the game is running on.
// For the Mega Drive, it usually would be "SEGA MEGA DRIVE" or "SEGA GENESIS".
// Some flashcarts enable extra functionality if a specific text is found here.
//
// All known system types so far:
//   "SEGA MEGA DRIVE"	| Mega Drive
//   "SEGA GENESIS"	    | Mega Drive
//   "SEGA 32X"		    | Mega Drive + 32X
//   "SEGA EVERDRIVE"	| Mega Drive (Everdrive extensions)
//   "SEGA SSF"		    | Mega Drive (Mega Everdrive extensions)
//   "SEGA MEGAWIFI"	| Mega Drive (Mega Wifi extensions)
//   "SEGA PICO"		| Pico
//   "SEGA TERA68K"		| Tera Drive (boot from 68000 side)
//   "SEGA TERA286"		| Tera Drive (boot from x86 side)
//
db "SEGA MEGA DRIVE "
// "1234567890123456"


//COPYRIGHT AND RELEASE DATE
// (16 Bytes ASCII String, Use Spaces For Unused Bytes)
//
// A field with the format "(C)XXXX YYYY.ZZZ", where:
//   "XXXX"	| Publisher
//   "YYYY"	| Release year
//   "ZZZ"	| Release month
//
// The "XXXX" part is a four-character abbreviation that identifies the publisher.
// Sega used to assign these codes (leading to the T-series numbers) but of course
// they don't anymore, so pick a four letter abbreviation that identifies you and
// is unlikely to clash.
// The release date is the four-digit year and a three-letter month abbreviation.
// Just take the first three letters of the month's name and make them uppercase.
//
db "(C)SEGA 1992.NOV"  //Sonic 2's example!
// "1234567890123456"


// GAME TITLE (DOMESTIC AND OVERSEAS)
// (48 Bytes ASCII String, Use Spaces For Unused Bytes)
//
// The game's name. Usually in all uppercase, pad the field with spaces.
// There are two title fields, to account for the fact that games may change name
// during localization. If you just keep the name the same everywhere then use it in
// both fields.
//
db "GAME TITLE                                      "  //Domestic title
db "GAME TITLE                                      "  //Overseas title
// "123456789012345678901234567890123456789012345678"


// SERIAL NUMBER
// (14 Bytes ASCII String, Use Spaces For Unused Bytes)
//
// A field with the format "XX YYYYYYYY-ZZ", where:
//   "XX"       | Software type
//   "YYYYYYYY" | Serial number
//   "ZZ"       | Revision
//
// The software type indicates what kind of software is in the cartridge (usually "GM", for game).
// The full list of known types so far is:
//   "GM"  | Game
//   "AI"  | Aid
//   "OS"  | Boot ROM (TMSS)
//   "BR"  | Boot ROM (Sega CD)
//
// The serial number is an identifier unique to the game that used to be assigned
// by Sega. Try to pick something that's unlikely to clash (maybe something using
// the publisher code from the copyright field to make it even more unlikely) and stick to it.
// The revision is a two-digit number indicating which release of the game is this.
// The initial release is "00", the first patch is "01", next one is "02", etc.
//
db "GM 00001051-00"
// "12345678901234"


// ROM CHECKSUM
// (2 Bytes)
// A 16-bit value that holds a checksum. Some games check the ROM to see if the checksum
// matches, and some emulators may also do it and complain if the checksum is bad, but
// otherwise it does nothing.
// You can compute the checksum by adding up every 16-bit word from address $000200 up to
// the end of the ROM (keep only the lower bits).
//
dw $0000 //Put the checksum here


//DEVICE SUPORT
// (16 Bytes ASCII String, Use Spaces For Unused Bytes)
//
// A list of devices or other features the game supports. One letter per device, the
// unused space is filled in with spaces. It's usually "J" (3 button controller)
// or "J6" (3 and 6 button controllers).
// Note that 6-button controllers only need to be added to the list if the game actually
// makes uses of the extra buttons. Do not add it to simply indicate that the game will
// work with those controllers.
//
// The full list is this:
//   "J"  | 3-button controller
//   "6"  | 6-button controller
//   "0"  | Master System controller
//   "A"  | Analog joystick
//   "4"  | Multitap
//   "G"  | Lightgun
//   "L"  | Activator
//   "M"  | Mouse
//   "B"  | Trackball
//   "T"  | Tablet
//   "V"  | Paddde
//   "K"  | Keyboard or keypad
//   "R"  | RS-232
//   "P"  | Printer
//   "C"  | CD-ROM (Sega CD)
//   "F"  | Floppy drive
//   "D"  | Download?
//
db "J               "
// "1234567890123456"


// ROM ADDRESS RANGE
// (8 Bytes)
//
// Two 32-bit values, indicating the address range covered by the cartridge. The first
// value is always $000000, while the last value is usually the ROM size minus one
// (unless you're using a mapper, then use the last address the console will see).
// Some common ROM sizes you may see:
//   $07FFFF  | 512KB
//   $0FFFFF  | 1MB
//   $1FFFFF  | 2MB
//   $3FFFFF  | 4MB
//
dd $00000000  // Start
dd $1fffffff  // End


//RAM ADDRESS RANGE
// (8 Bytes)
//
// Two 32-bit values, indicating where RAM starts and ends. In the case of the
// Mega Drive, they should be always $FF0000 and $FFFFFF.
//
dd $00ff0000  // Start
dd $00ffffff  // End


// EXTRA MEMORY
// (12 Bytes)
//
// This field indicates if there's extra memory (e.g. for saving progress, or simply
// extra RAM to toy with). The contents of this field depends on what's in the cartridge.
// If the game doesn't have extra memory, fill it with spaces.
// If the game does have extra RAM, the field is as follows:
//   2 bytes  | Always "RA"
//   1 byte   | RAM type
//   1 byte   | Always $20
//   4 bytes  | Start address
//   4 bytes  | End address
//
// The RAM type is used to indicate whether the data is saved when turning off the
// console and what kind of accesses (byte or word) are allowed:
//
//   Type | Saves? | Usage
//   -----|--------|-----------------------
//   $A0  | No     | 16-bit
//   $B0  | No     | 8-bit (even addresses)
//   $B8  | No     | 8-bit (odd addresses)
//   $E0  | Yes    | 16-bit
//   $F0  | Yes    | 8-bit (even addresses)
//   $F8  | Yes    | 8-bit (odd addresses)
//
// Extra memory NOT present: // Uncomment if needed
// db "            " 
//    "123456789012"
//
// SRAM Present:
db "RA"
db $f8        // SRAM Type
db $20
dd $00200001  // SRAM Start Address
dd $0020ffff  // SRAM End Address
//
// Eprom Present: // Uncomment if needed
// db "RA"
// db $e8        // Eprom Type
// db $20
// dd $00200001  // Eprom Start Address
// dd $00200001  // Eprom End Address


// MODEM SUPPORT
// (12 Bytes ASCII String, Use Spaces For Unused Bytes)
//
// If the modem is not supported, pad with spaces.
//
db "            "
// "123456789012"


//RESERVED SPACE
// (40 Bytes ASCII String, filled with spaces)
db "                                        "
// "1234567890123456789012345678901234567890


// REGION SUPPORT
// (3 Bytes ASCII String, Use Spaces For Unused Bytes)
//
// A list of all the regions the game supports (one letter per region). This field
// had two formats over the Mega Drive's lifespan: the original format (we'll call
// it "old style") is the most well known and is one letter per region. The later
// format (we'll call it "new style") uses a single character to store information
// about all regions.
// We recommend sticking to the original "old style" format in homebrew.
//
// The old style is the most well known format, it stores one letter per region.
// If not all the regions are used then pad the field with spaces. The regions can
// come in any order. To support all three regions just use "JUE".
db "U  "
// "123"


//RESERVED SPACE
// (13 Bytes ASCII String, filled with spaces)
db "             "
// "1234567890123

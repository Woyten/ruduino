#![feature(asm, lang_items, unwind_attributes)]
#![no_std]
#![no_main]

extern crate ruduino;

use ruduino::cores::atmega328p::PORTB;
use ruduino::cores::atmega328p::DDRB;
use ruduino::Register;

#[no_mangle]
pub extern "C" fn main() {
    // Set all PORTB pins up as outputs
    DDRB::write(0xFF);

    loop {
        // Set all pins on PORTB to high.
        PORTB::write(0xFF);

        small_delay();

        // Set all pins on PORTB to low.
        PORTB::write(0x00);

        small_delay();
    }
}

/// A small busy loop.
fn small_delay() {
    for _ in 0..400000 {
        unsafe { asm!("" :::: "volatile") }
    }
}

# Julia-Ciphers
This repository contains the implementations of various ciphers in Julia

I'm currently learning the Julia language, and as I have a keen interest in cryptography I will implement various ciphers in Julia.

I will start relatively simple but hopefully advancing to more complex implementations.

To test any of these yourself, you only need to include the file on your Julia REPL and the program should run automatically

* The Caesar cipher is a very simple substitution, with each letter being 'incremented' a given amount to produce ciphertext. It was to used by Julius Caesar to encode military messages.

* The Vigenère cipher builds on the Caesar cipher. Along with the plaintext, a key must also be provided of equal length. This key is often a word repeated several times up to the length of the plaintext, for example "PaulPaulPa" Then for each letter of the plaintext, a Caesar cipher is carried out where 'A' corresponds to the letter at the same position in the key. First described in 1553 by Giovan Battista Bellaso, it resisted attempts to break it until 1863.

* The Enigma cipher is one of the most famous ciphers, primarily used by the Axis powers in WW2. Various models were produced, but I am focusing on the Enigma I machine. The machine contains 3 rotors (more are available in later machines), a number of disks, a plug board and a reflector, all of which can be configured in various way to vary  the ciphertext output. In simple terms, the process goes as follows: 
Firstly, the plaintext passes though the plug board which maps some letters to certain others. Then, the signal passes through R1 -> R2 -> R3 -> REF -> R3' -> R2' -> R1' where R(x) denotes a rotor at a given position, REF represents a reflector and ' shows a rotor has been reflected. Finally, the signal is again passed through the plugboard before outputting the ciphertext. The rotors do not act as a simple odometer however - the rotors also rotate subject to certain conditions. 
As of yet I've only implemented a basic version, missing many components. I hope to add these in future.


Future Targets:

* Sanitise inputs

* UI?

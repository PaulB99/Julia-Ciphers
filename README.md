# Julia-Ciphers
This repository contains the implementations of various ciphers in Julia

I'm currently learning the Julia language, and as I have a keen interest in cryptography I will implement various ciphers in Julia.

I will start relatively simple but hopefully advancing to more complex implementations.

To test any of these yourself, you only need to include the file on your Julia REPL and the program should run automatically

* The Caesar cipher is a very simple substitution, with each letter being 'incremented' a given amount to produce ciphertext. It was to used by Julius Caesar to encode military messages.

* The Vigenère cipher builds on the Caesar cipher. Along with the plaintext, a key must also be provided of equal length. This key is often a word repeated several times up to the length of the plaintext, for example "PaulPaulPa" Then for each letter of the plaintext, a Caesar cipher is carried out where 'A' corresponds to the letter at the same position in the key. First described in 1553 by Giovan Battista Bellaso, it resisted attempts to break it until 1863.

* The Enigma cipher is one of the most famous ciphers, primarily used by the Axis powers in WW2. Various models were produced, but I am focusing on the Enigma I machine. The machine contains 3 rotors (more are available in later machines), a number of disks, a plug board and a reflector, all of which can be configured in various way to vary  the ciphertext output. In simple terms, the process goes as follows: 
Firstly, the plaintext passes though the plug board which maps some letters to certain others. Then, the signal passes through R1 -> R2 -> R3 -> REF -> R3' -> R2' -> R1' where R(x) denotes a rotor at a given position, REF represents a reflector and ' shows a rotor has been reflected. Finally, the signal is again passed through the plugboard before outputting the ciphertext. The rotors do not act as a simple odometer however - the rotors also rotate subject to certain conditions. 
I have currently implemented the majority of settings available in the Enigma I machine, missing only ring settings. I hope to add these in future.

* The Beaufort cipher works similarly to the Vigenère cipher. A keyword is to be provided, this keyword is then repeated up to the length of the plaintext to create a key. This key is then used to reference to a tableau, which produces an output letter for a given combination of plaintext and key characters. The cipher was created by Sir Francis Beaufort. I have also implemented the German variant, who's only difference if that the plaintext and and key have their roles switched in respect to the tableau.

* The Playfair cipher was created by Charles Wheatstone in 1854, but bears the name of Lord Playfair who sponsored its use. A keyword is provided, which is incorparated into a 5x5 alphabet grid. To accomodate the 26 letter alphabet a letter must be removed, usually 'j' is replaced with 'i'. The plaintext is split into bigrams, and any bigram with 2 repeated letters has the second replaced with 'X', and any incomplete bigram has 'X' appended to it. Then substitution takes place using these bigrams and the grid, such that squares are formed on the grid, with the 2 letters of a bigram consituting opposite corners of the square. The bigram is then replaced by the other 2 corners of the square created to produce the corresponding ciphertext bigram. The cipher was actually rejected by the foreign office originally due to its perceived complexity, however was later used by British forces in the second Boer war, WW1 and WW2 as it is quick to use and requires no special equipment, unlike many other effective ciphers at the time.

* The Affine cipher uses a simple mathematical formula to substitute letters, and the inverse function is used to decrypt. An encrypted letter E(x) = (ax + b) mod m  where m is the total letters in the alphabet, and a and b are values chosen as a key where a and m must be coprime. The inverse function a^-1 (x-b) mod m is used for decryption.

Future Targets:

* Sanitise inputs

* UI?

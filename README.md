# Julia-Ciphers
This repository contains the implementations of various ciphers in Julia

I'm currently learning the Julia language, and as I have a keen interest in cryptography I will implement various ciphers in Julia.

I will start relatively simple but hopefully advancing to more complex implementations.

* The Caesar cipher is a very simple substitution, with each letter being 'incremented' a given amount to produce ciphertext. It was to used by Julius Caesar to encode military messages.

* The Vigenère cipher builds on the Caesar cipher. Along with the plaintext, a key must also be provided of equal length. This key is often a word repeated several times up to the length of the plaintext, for example "PaulPaulPa" Then for each letter of the plaintext, a Caesar cipher is carried out where 'A' corresponds to the letter at the same position in the key. First described in 1553 by Giovan Battista Bellaso, it resisted attempts to break it until 1863.

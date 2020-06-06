# A Julia implementation of the Affine ciphertext

# Main function
function affine()

    m = 26 # The number of letters in the alphabet used
    println("Please input the plaintext")
    plaintext = readline()
    plaintext = uppercase(plaintext)
    plaintext = replace(plaintext, " " => "")

    println("Please enter the a value")
    a = parse(Int, readline())
    while a % m != 0
        println("a value invalid, must be coprime with m value " * string(m))
        a = parse(Int, readline())
    end
    println("Please enter the b value")
    b = parse(Int, readline())
end

affine()

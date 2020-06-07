# A Julia implementation of the Affine ciphertext

# Determines if 2 values are coprime
function coprime(x, y)
    xlist = []
    ylist = []
    for i in 2 : x
        if x % i == 0
            push!(xlist, i)
        end
    end
    for j in 2 : y
        if y % j == 0
            push!(ylist, j)
        end
    end
    for a in xlist
        for b in ylist
            if a == b
                return false
            end
        end
    end
    return true
end

# Changes a char to an int value
function charToVal(c)
    alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    val = findfirst(isequal(c), alphabet)
    return val
end

# Changes a value to a char1
function valToChar(i)
    alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    char = alphabet[i]
    return char
end

# Main function
function affine()

    m = 26 # The number of letters in the alphabet used
    println("Please input the plaintext")
    plaintext = readline()
    plaintext = uppercase(plaintext)
    plaintext = replace(plaintext, " " => "")

    # Take keys and ensure they're valid
    println("Please enter the a value")
    a = parse(Int, readline())
    while !coprime(a, m)
        println("a value invalid, must be coprime with m value " * string(m))
        a = parse(Int, readline())
    end
    println("Please enter the b value")
    b = parse(Int, readline())

    # Produce the ciphertext
    ciphertext = ""
    for c in plaintext
        val = charToVal(c) - 1 # Must account for Julia being 1-indexed
        newVal = mod(((a * val) + b), m)
        newchar = valToChar(newVal + 1)
        ciphertext *= newchar
    end
    println(ciphertext)
end

affine()

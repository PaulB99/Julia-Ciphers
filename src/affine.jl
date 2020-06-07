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

# Main function
function affine()

    m = 26 # The number of letters in the alphabet used
    println("Please input the plaintext")
    plaintext = readline()
    plaintext = uppercase(plaintext)
    plaintext = replace(plaintext, " " => "")

    println("Please enter the a value")
    a = parse(Int, readline())
    while !comprime(a, m)
        println("a value invalid, must be coprime with m value " * string(m))
        a = parse(Int, readline())
    end
    println("Please enter the b value")
    b = parse(Int, readline())
end

coprime(10, 26)
#affine()

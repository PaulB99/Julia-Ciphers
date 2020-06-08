# An implementation of the baconian cipher in Julia

function baconian()

    # The key for each letter
    keys = ["aaaaa", "aaaab", "aaaba", "aaabb", "aabaa", "aabab", "aabba", "aabbb", "abaaa","abaaa", "abaab", "ababa", "ababb", "abbaa", "abbab", "abbba", "abbbb", "baaaa", "baaab", "baaba", "baabb","baabb", "babaa", "babab", "babba", "babbb"]
#=  A = "aaaaa"    I = "abaaa"    R = "baaaa"
    B = "aaaab"    K = "abaab"    S = "baaab"
    C = "aaaba"    L = "ababa"    T = "baaba"
    D = "aaabb"    M = "ababb"    U = "baabb"
    E = "aabaa"    N = "abbaa"    W = "babaa"
    F = "aabab"    O = "abbab"    X = "babab"
    G = "aabba"    P = "abbba"    Y = "babba"
    H = "aabbb"    Q = "abbbb"    Z = "babbb" =#

    # Take input

    println("Please input the secret message")
    secret = readline()
    secret = uppercase(secret)
    secret = replace(secret, "V" => "U")
    secret = replace(secret, "J" => "I")
    secret = replace(secret, " " => "")

    println("Please input the normal text (5 times longer than the secret)")
    text = readline()
    text = replace(text, " " => "")
    while length(text) != 5 * length(secret)
        println("Not 5 times the length of the secret. Try again")
        text = readline()
    end
    text = lowercase(text)

    cipherarray = []

    # Encrypt
    for i in 0:(length(secret)-1)
        letter = secret[i+1]
        code = keys['Z' - letter + 1]
        for j in 1:length(code)
            if code[j] == 'b'
                push!(cipherarray, uppercase(text[5i+j]))
            else
                push!(cipherarray, lowercase(text[5i+j]))
            end
        end
    end
    # Covert array to String
    ciphertext = join(cipherarray)
    println(ciphertext)
end

baconian()

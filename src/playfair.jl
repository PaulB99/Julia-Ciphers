# An implementation of the Playfair cipher in Julia

function playfair()

    # A keyword is needed to create the square
    println("Please enter a keyword")
    keyword = readline()
    alphabet = "abcdefghiklmnopqrstuvwxyz" # No j

    # Substitute all j's for i's
    keyword = replace(keyword, "j" => "i")

    # Create a string representation of the square
    keyString = ""
    for c in keyword
        if !in(c, keyString)
            keyString = string(keyString, string(c))
        end
    end
    for c in alphabet
        if !in(c, keyString)
            keyString = string(keyString, string(c))
        end
    end
    println(keyString)
end

playfair()

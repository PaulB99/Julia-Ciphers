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

    # Fill 5x5 grid
    str1 = split(SubString(keyString, 1, 5), "")
    str2 = split(SubString(keyString, 6, 10), "")
    str3 = split(SubString(keyString, 11, 15), "")
    str4 = split(SubString(keyString, 16, 20), "")
    str5 = split(SubString(keyString, 21, 25), "")
    keygrid = [str1 str2 str3 str4 str5]
    # Needs rotating the right way
    grid = Array{String}(undef, 5, 5)
    for c in keygrid
        i = findfirst(isequal(c), keygrid)
        #x = (i % 4) + 1
        #y = round(Int, i / 5, RoundUp)
        x = i[2]
        y = i[1]
        grid[x,y] = c
    end
    show(stdout, "text/plain", grid)
end

playfair()

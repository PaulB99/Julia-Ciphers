# An implementation of the Playfair cipher in Julia

# Loops an index if it is greater than 5
function loop5(i)
    if i > 5
        i -= 5
    end
    return i
end

# The main function
function playfair()

    # A keyword is needed to create the square
    println("Please enter a keyword")
    keyword = readline()
    keyword = uppercase(keyword)
    alphabet = "ABCDEFGHIKLMNOPQRSTUVWXYZ" # No j

    # Substitute all j's for i's
    keyword = replace(keyword, "J" => "I")

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
        x = i[2]
        y = i[1]
        grid[x,y] = c
    end
    #show(stdout, "text/plain", grid)

    # Take the plaintext
    println("Please enter the plaintext")
    plaintext = readline()
    plaintext = uppercase(plaintext)


    # Remove spaces and turn into bigrams
    plaintext = replace(plaintext, " " => "")

    # Add X on the end if the text is of odd length
    if isodd(length(plaintext))
        plaintext = plaintext * "X"
    end

    # Turn into bigrams
    bigrams = []
    for i in 1:length(plaintext)
        if iseven(i)
            bigram = plaintext[i-1] * plaintext[i]
            push!(bigrams, bigram)
        end
    end

    # Replace repeated letters with X
    for i in eachindex(bigrams)
        if bigrams[i][1] == bigrams[i][2]
            bigrams[i] = bigrams[i][1] * "X"
        end
    end

    # Use the grid to encrypt the plaintext
    ciphertext = ""
    for b in bigrams
        pos1 = findfirst(isequal(string(b[1])), grid)
        pos2 = findfirst(isequal(string(b[2])), grid)
        if pos1[2] == pos2[2] # Same X
            println("2")
            ciphertext *= grid[loop5(pos1[1] + 1), pos1[2]] * grid[loop5(pos2[1] + 1), pos2[2]] * " "
        elseif pos1[1] == pos2[1] # Same Y
            println("1")
            ciphertext *= grid[pos1[1], loop5(pos1[2] + 1)] * grid[pos2[1], loop5(pos2[2] + 1)] * " "
        else # Must form a square
            ciphertext *= grid[pos1[1], pos2[2]] * grid[pos2[1], pos1[2]] * " "
        end
    end
    println(ciphertext)
    println("BM OD ZB XD NA BE KU DM UI XM MO UV IF ")
end

playfair()

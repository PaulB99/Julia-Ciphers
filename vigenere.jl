# A Julia implementation of a Vigenere cipher

function vigenere()
    #Get plaintext and key
    println("Please enter the text: ")
    text = readline()
    println("Please enter the key: ")
    key = readline()
    #Key must be of equal length to plaintext
    while length(key) != length(text)
        println("Error: key must be the same length as the text: ", length(text))
        key = readline()
    end

    #The original cipher operated in uppercase, so I feel it is appropriate here
    text = uppercase(text)
    key = uppercase(key)

    #=Now we have a suitable text and key, time to encrypt. Index points to the current position in the Key
    A caesar cipher is carried out each time, where A corresponds to the current position in the Key
    Julia is 1 indexed! =#
    index = 1
    for char in text
        distance = key[index] - 'A'
        newchar = char + distance
        if(newchar > 'Z')
            newchar -= 26
        end
        if(newchar < 'A')
            newchar += 26
        end
        index += 1
        print(newchar)
    end

end
vigenere()

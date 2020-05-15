# An implementation of the German variant of the Beaufort cipher in Julia

function germanBeaufort()
    #Get plaintext and key
    println("Please enter the text: ")
    text = readline()
    println("Please enter the keyword: ")
    keyword = readline()
    text = uppercase(text)
    keyword = uppercase(keyword)
    key = ""

    # The keyword must be repeated until it matches the length of the text
    for i = firstindex(text):lastindex(text)
        #pos = ((c - 'A') % length(keyword)) + 1
        pos = i
        while pos > length(keyword)
            pos -= length(keyword)
        end
        key = string(key, keyword[pos])
    end

    # Now encrypt. Works the same as Vigenere, except subtracts rather than adding distance and the key and plaintext have opposite roles
    index = 1
    for char in text
        distance = key[index] - 'A'
        newchar = char - distance
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
germanBeaufort()

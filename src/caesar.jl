# A Caesar cipher implementation in Julia

function caesar()
    println("Please enter the text: ")
    text = readline()
    println("Please enter key")
    key = parse(Int, readline())
    for char in text
        newchar = char + key
        if(newchar > 'z')
            newchar -= 26
        end
        if(newchar < 'a')
            newchar += 26
        end
        print(newchar)
    end
end
caesar()

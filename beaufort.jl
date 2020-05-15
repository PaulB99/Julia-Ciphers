# An implementation of the Beaufort cipher in Julia

function beaufort()
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
    print(key)
end
beaufort()

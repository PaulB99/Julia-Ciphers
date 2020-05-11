#An implementation of the Enigma I machine in Julia

#This function ensures an index is between 1 and 26, and if not loops it around
function loopIndex(i)
    if(i > 26)
        i -= 26
    end
    if(i < 1)
        i += 26
    end
    return i
end

#This function ensures a character is in the range A - Z, and if not loops it around
function loopChar(c)
    if(c > 'Z')
        c -= 26
    end
    if(c < 'A')
        c += 26
    end
    return c
end

#This method increments a list of characters according to a given int
function incrementMappings(s, i)
    out = ""
    for c in s
        c = loopChar(c + i)
        out = string(out, c)
    end
    return out
end

# This function gets the correct rotor and step given a Key
function getRotor(i)
    #= In this model, only rotors I, II and III are available
    These mappings are the same as the original machines. =#
    rotor1 = "EKMFLGDQVZNTOWYHXUSPAIBRCJ"
    rotor1step = 'Q'
    rotor2 = "AJDKSIRUXBLHWTMCQGZNPYFVOE"
    rotor2step = 'E'
    rotor3 = "BDFHJLCPRTXVZNYEIWGAKMUSQO"
    rotor3step = 'V'
    if i == '1'
        return rotor1, rotor1step
    elseif i == '2'
        return rotor2, rotor2step
    elseif i == '3'
        return rotor3, rotor3step
    end
end

# This function gets the correct reflector. It defaults to UKW - B
function getReflector(i)
    reflectorA = "EJMZALYXVBWFCRQUONTSPIKHGD"
    reflectorB = "YRUHQSLDPXNGOKMIEBFZCWVJAT"
    reflectorC = "FVPJIAOYEDRZXWGCTKUQSBNMHL"
    if i == "A"
        return reflectorA
    elseif i == "C"
        return reflectorC
    else
        return reflectorB
    end
end

#The main function
function enigma()
    # Get plaintext
    println("Please enter the text: ")
    text = readline()
    text = uppercase(text)

    # Select the orders of rotors used
    println("Please enter the rotor order in the form XXX")
    rotorOrder = readline()
    if length(rotorOrder) == 0
        firstRotor, firstRotorStep = getRotor('3')
        secondRotor, secondRotorStep = getRotor('2')
        thirdRotor,thirdRotorStep = getRotor('1')
    else
        firstRotor, firstRotorStep = getRotor(rotorOrder[1])
        secondRotor, secondRotorStep = getRotor(rotorOrder[2])
        thirdRotor,thirdRotorStep = getRotor(rotorOrder[3])
    end

    # The user can set the rotor starting positions
    println("Enter the starting rotor positions in the form XXX, or press enter to use the default AAA")
    startPos = readline()
    if(length(startPos) == 0)
        increment1 = 0
        increment2 = 0
        increment3 = 0
    else
        increment1 = startPos[3] - 'A'
        increment2 = startPos[2] - 'A'
        increment3 = startPos[1] - 'A'
    end

    #= The standard reflector used in the war was reflector UKW-B, so I use it as the default
    The user can also choose UKW-A or UKW-C if they wish =#
    println("Please specify the reflector (A for UKW-A, B for UKW-B or C for UKW-C) or press enter to use the default UKW-B")
    reflectorChoice = readline()
    if length(reflectorChoice) == 0
        reflector = getReflector('B')
    else
        reflector = getReflector(reflectorChoice)
    end

    #=To start, I will also assume fixed ring settings
    TODO: implement ring settings =#
    println("DON'T USE Enter the ring positions in the form XXX, or press enter to use the default AAA")
    ringSettings = readline()
    if(length(ringSettings) == 0)
        ring1 = 0
        ring2 = 0
        ring3 = 0
    else
        ring1 = ringSettings[3] - 'A'
        #increment1 -= ring1
        ring2 = ringSettings[2] - 'A'
        #increment2 -= ring2
        ring3 = ringSettings[1] - 'A'
        #increment3 -= ring3
    end

    # The mappings need to be all incremented according to the ring settings
    firstRotor = incrementMappings(firstRotor, ring1)
    secondRotor = incrementMappings(secondRotor, ring2)
    thirdRotor = incrementMappings(thirdRotor, ring3)

    #Plug board settings (Steckerbrett) directly map given letters at the very beginning and very end of operation
    println("Please Insert plug board settings in the form AB CD EF etc. or press enter to use no plug board")
    plugBoardInput = readline()
    plugBoardInput = uppercase(plugBoardInput)
    plugBoard = split(plugBoardInput)

    #=Now it is time to run the cipher
    The input first goes through the plug board (if used)
    It then goes R1 -> R2 -> R3 -> REF -> R3' -> R2' -> R1'
    Where R(x) denotes the rotor at a given position, ' denotes an inverted rotor and REF denotes a reflector
    The output finally goes though the plug board again (if used) =#
    for char in text

        #Step rotors
        increment1 += 1
        #=if('A' + increment1  == rotor2step)
            increment2 += 1
        end
        if('A' + increment2   == rotor3step)
            increment3 += 1
        end =#

        # Plug board
        for s in plugBoard
            if s[1] == char
                char = s[2]
            end
        end

        # First rotor
        index = char - 'A' + increment1 + 1
        index = loopIndex(index)
        char1 = loopChar(firstRotor[index] - increment1)

        # Second rotor
        index = char1 - 'A' + increment2 + 1
        index = loopIndex(index)
        char2 = loopChar(secondRotor[index] - increment2)

        # Third rotor
        index = char2 - 'A' + increment3 + 1
        index = loopIndex(index)
        char3 = loopChar(thirdRotor[index] - increment3)

        # Reflector
        index = char3 - 'A' + 1
        index = loopIndex(index)
        refChar = reflector[index]

        # Third rotor reflected (takes the index from the rotor, and works backwards to the normal alphabet)
        #The increments much be taken into account in reverse
        val = refChar + increment3
        # It must be insured any character used is alphabetical
        val = loopChar(val)
        index = findfirst(isequal(val), thirdRotor)  - increment3
        index = loopIndex(index)
        char4 = loopChar('A' + index - 1)

        # Second rotor reflected (takes the index from the rotor, and works backwards to the normal alphabet)
        val = char4 + increment2
        val = loopChar(val)
        index = findfirst(isequal(val), secondRotor)  - increment2
        index = loopIndex(index)
        char5 = loopChar('A' + index - 1)

        # First rotor reflected (takes the index from the rotor, and works backwards to the normal alphabet)
        val = char5 + increment1
        val = loopChar(val)
        index = findfirst(isequal(val), firstRotor)  - increment1
        index = loopIndex(index)
        char6 = loopChar('A' + index - 1)

        # Plug board
        for s in plugBoard
            if s[2] == char6
                char6 = s[1]
            end
        end

        #=print(char1)
        print(char2)
        print(char3)
        print(refChar)
        print(char4)
        print(char5) =#

        print(char6)

    end
end
enigma()

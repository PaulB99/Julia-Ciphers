#An implementation of the Enigma I machine in Julia

function enigma()
    # Get plaintext
    println("Please enter the text: ")
    text = readline()
    text = uppercase(text)
    #= In this model, only rotors I, II and III are available
    These mappings are the same as the original machines. =#
    rotor1 = "EKMFLGDQVZNTOWYHXUSPAIBRCJ"
    rotor1step = 'Q'
    rotor2 = "AJDKSIRUXBLHWTMCQGZNPYFVOE"
    rotor2step = 'E'
    rotor3 = "BDFHJLCPRTXVZNYEIWGAKMUSQO"
    rotor3step = 'V'

    #=I will assume the order 3 -> 2 -> 1 for now
    TODO: implement choosing rotor order =#
    println("Rotor order not yet implemented, please press enter")
    order = readline()

    firstRotor = rotor3
    firstRotorStep = rotor3step

    secondRotor = rotor2
    secondRotorStep = rotor2step

    thirdRotor = rotor1
    thirdRotorStep = rotor1step

    #= I will assume the rotors start at the AAA position for now
    TODO: implement rotor starting positions =#
    increment1 = 0
    increment2 = 0
    increment3 = 0

    #= The standard reflector used in the war was reflector UKW-B, so I use it here
    I may add other reflectors in the future
    TODO: Add more reflectors =#
    println("Different reflectors not yet implemented, press enter to use the default UKW-B")
    reflectorChoice = readline()

    reflectorB = "YRUHQSLDPXNGOKMIEBFZCWVJAT"
    reflector = reflectorB

    #=To start, I will also assume fixed ring settings
    TODO: implement ring settings =#
    println("Ring settings not yet implemented, press enter to use default")
    ringSettings = readline()

    #=Plug board settings are complex, they will probably be the last thing I implement
    TODO: implement plug board settings =#
    println("Plug board settings not yet implemented, press enter to skip this step")
    plugBoard = readline()

    #=Now it is time to run the cipher
    The input first goes through the plug board (if used)
    It then goes R1 -> R2 -> R3 -> REF -> R3' -> R2' -> R1'
    Where R(x) denotes the rotor at a given position, ' denotes an inverted rotor and REF denotes a reflector
    The output finally goes though the plug board again (if used) =#
    for char in text
        # First rotor
        index = char - 'A' + increment1 + 1
        if(index > 26)
            index -= 26
        end
        if(index < 1)
            index += 26
        end
        char1 = firstRotor[index]
        #TODO implement stepping

        # Second rotor
        index = char1 - 'A' + increment2 + 1
        if(index > 26)
            index -= 26
        end
        if(index < 1)
            index += 26
        end
        char2 = secondRotor[index]
        #TODO implement stepping

        # Third rotor
        index = char2 - 'A' + increment3 + 1
        if(index > 26)
            index -= 26
        end
        if(index < 1)
            index += 26
        end
        char3 = thirdRotor[index]
        #TODO implement stepping

        # Reflector
        index = char3 - 'A' + 1
        if(index > 26)
            index -= 26
        end
        if(index < 1)
            index += 26
        end
        refChar = reflector[index]

        # Third rotor reflected (takes the index from the rotor, and works backwards to the normal alphabet)
        index = findfirst(isequal(refChar), thirdRotor)  - increment3
        if(index > 26)
            index -= 26
        end
        if(index < 1)
            index += 26
        end
        char4 = 'A' + index - 1
        #TODO implement stepping

        # Second rotor reflected (takes the index from the rotor, and works backwards to the normal alphabet)
        index = findfirst(isequal(char4), secondRotor)  - increment2
        if(index > 26)
            index -= 26
        end
        if(index < 1)
            index += 26
        end
        char5 = 'A' + index - 1
        #TODO implement stepping

        # First rotor reflected (takes the index from the rotor, and works backwards to the normal alphabet)
        index = findfirst(isequal(char5), firstRotor)  - increment1
        if(index > 26)
            index -= 26
        end
        if(index < 1)
            index += 26
        end
        char6 = 'A' + index - 1
        #TODO implement stepping

        #TODO Plug board here

        print(char6)
    end
end
enigma()

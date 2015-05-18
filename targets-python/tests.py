"""Tests for enigma.py and enigma.dart

You should use `targets check` to run these tests 
rather than attempting to execute this file directly.
"""

from enigma import *
import bombe

import sys
import random

cleartext = "NOBODYEXPECTSTHESPANISHINQUISITION"

def test_plugboard():
    p = Plugboard()
    p.add_plug("A", "Z")
    p.add_plug("R", "Q")
    p.add_plug("S", "E")
    output = ""
    output += p.translate("Z")
    output += p.translate("P");
    output += p.translate("S");
    output += p.translate("Q");
    output += p.translate("A");
    print(output)
    
def test_simple():
    p = Plugboard()
    left = Rotor(1, 1)
    middle = Rotor(2, 1)
    right = Rotor(3, 1)
    enig = Enigma(p, reflector_b, left, middle, right)
    print(enig.translate_message("TARGETS", "AAA"))
    
def test_moderate():
    p = Plugboard()
    p.add_plug("A", "Z")
    p.add_plug("X", "D")
    p.add_plug("M", "V")
    left = Rotor(4, 1)
    middle = Rotor(5, 5)
    right = Rotor(1, 1)
    enig = Enigma(p, reflector_c, left, middle, right)
    print(enig.translate_message("TARGETS", "AAA"))
    
def test_complex():
    p = Plugboard()
    p.add_plug("A", "Z")
    p.add_plug("X", "D")
    p.add_plug("M", "V")
    p.add_plug("E", "F")
    left = Rotor(4, 7)
    middle = Rotor(5, 3)
    right = Rotor(1, 14)
    enig = Enigma(p, reflector_c, left, middle, right)
    print(enig.translate_message("TARGETS", "MZN"))
    
def test_bombe_plug():
    p = random_plugboard()
    rotors = random_rotors()
    r = random_reflector()
    enig = Enigma(p, r, rotors[0], rotors[1], rotors[2])
    setting = random_message_setting()
    output = enig.translate_message(cleartext, setting)
    found = bombe.find_plugboard(rotors[0], rotors[1], rotors[2], 
                                r, cleartext, output, setting)
    if not found:
        print("find_plugboard returned None")
        return
    crack = Enigma(found, r, rotors[0], rotors[1], rotors[2])
    decrypt = crack.translate_message(output, setting)
    if cleartext != decrypt:
        print("Incorrect plugboard")
        
def test_bombe():
    p = random_plugboard()
    rotors = [1, 2, 3, 4, 5]
    random.shuffle(rotors)
    left = Rotor(rotors[0], random.randint(1, 26))
    middle = Rotor(rotors[1], random.randint(1, 26))
    right = Rotor(rotors[2], random.randint(1, 26))
    refl = random_reflector()
    enig = Enigma(p, refl, left, middle, right)
    setting = random_message_setting()
    output = enig.translate_message(cleartext, setting)
    crack = bombe.crack_code(cleartext, output, setting, [rotors[0]], 
                                [rotors[1]], [rotors[2]], [refl])
    if not crack:
        print("crack_code returned None")
        return
    decrypt = crack.translate_message(output, setting)
    if cleartext != decrypt:
        print("Incorrect Enigma configuration")
        
def random_plugboard():
    letters = random.sample(ALPHABET, 26)
    p = Plugboard()
    for i in range(0, 20, 2):
        p.add_plug(letters[i], letters[i + 1])
    return p
    
def random_rotors():
    rotors = []
    types = [1, 2, 3, 4, 5]
    random.shuffle(types)
    for i in range(0, 3):
        rotors.append(Rotor(types[i], random.randint(1, 26)))
    return rotors
    
def random_reflector():
    refl = [reflector_a, reflector_b, reflector_c]
    return refl[random.randrange(0, 3)]
    
def random_message_setting():
    setting = ""
    for i in range(0, 3):
        setting += ALPHABET[random.randrange(0, 26)]
    return setting
    

if len(sys.argv) < 2:
    print("Please use `targets check` to run these tests")
    exit(0)

if sys.argv[1] == "plugboard":
    test_plugboard()
elif sys.argv[1] == "simple":
    test_simple()
elif sys.argv[1] == "moderate":
    test_moderate()
elif sys.argv[1] == "complex":
    test_complex()
elif sys.argv[1] == "bombe_plug":
    test_bombe_plug()
elif sys.argv[1] == "bombe":
    test_bombe()
else:
    print("Please use `targets check` to run these tests")
    
"""Command Line Interface for Enigma
Usage:
python enigmacli.py [left rotor #]   [left ring setting]
                    [middle rotor #] [middle ring setting]
                    [right rotor #]  [right ring setting]
                    [reflector type] [plugboard pair] [plugboard pair]...
Default settings are rotors 1, 2, and 3 all with ring setting 1, reflector B, and no plugs.
For each line of input, start with the three letter message setting,
then a space, and then the actual contents of your message.
Lowercase letters will be converted to capital letters; non-letters will be left as is
"""

from enigma import *

import sys

left = Rotor(1, 1)
middle = Rotor(2, 1)
right = Rotor(3, 1)
reflector = reflector_b
p = Plugboard()

if len(sys.argv) >= 7:
    left = Rotor(int(sys.argv[0]), int(sys.argv[1]))
    middle = Rotor(int(sys.argv[2]), int(sys.argv[3]))
    right = Rotor(int(sys.argv[4]), int(sys.argv[5]))
    r = args[6].upper()
    if r == 'A':
        reflector = reflector_a
    if r == 'B':
        reflector = reflector_b
    if r == 'C':
        reflector = reflector_c
    for i in range(7, len(sys.argv)):
        pair = sys.argv[i].upper()
        p.add_plug(pair[0], pair[1])
    

enig = Enigma(p, reflector, left, middle, right)
for line in sys.stdin:
    line = line.upper()
    parts = line.split(" ")
    setting = parts[0]
    message = line[len(setting) + 1:]
    encoded = enig.translate_message(message, setting)
    print(encoded)
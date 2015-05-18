"""Enigma - Sample project for Targets"""

ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

class Enigma():
    """Represents an Enigma machine"""
    
    def __init__(self, plugboard, reflector, left, middle, right):
        """Creates a new Enigma machine with given Plugboard, Reflector, and Rotors"""
        self.plugboard = plugboard
        self.reflector = reflector
        self.left = left
        self.middle = middle
        self.right = right
        
    def translate_message(self, message, setting):
        """Translates a message with given message setting
        Convert all lowercase letters to uppercase
        Leave non-letter characters as is
        """
        # Your Code Here
        return "CHANGE THIS"
        
        
class Plugboard():
    """Represents the plugboard"""
    
    def __init__(self):
        """Creates a new empty Plugboard"""
        # Your Code Here
        
    def add_plug(self, a, b):
        """Connects a with b on the plugboard
        Assume that both a and b are single uppercase letters
        Raises an error if a equals b or if either a or b is already matched
        """
        # Your Code Here
        
    def translate(self, letter):
        """If letter is paired with another letter, return it.
        Otherwise, just return letter.
        Assume that letter is a single uppercase letter
        """
        # Your Code Here
        return "A"
        
        
class Reflector():
    """Represents a reflector"""
    
    def __init__(self, reflected):
        """Creates a new rotor with the n-th letter of the alphabet
        translating into the n-th letter of reflected
        """
        self.reflected = reflected
        
    def reflect(self, letter):
        """Reflects the given letter"""
        # Your Code Here
        return "A"
        

reflector_a = Reflector("EJMZALYXVBWFCRQUONTSPIKHGD")
reflector_b = Reflector("YRUHQSLDPXNGOKMIEBFZCWVJAT")
reflector_c = Reflector("FVPJIAOYEDRZXWGCTKUQSBNMHL")
    

class Rotor():
    """Represents a rotor and its internal setting"""
    
    def __init__(self, rotor, ring_setting):
        """Creates a new rotor with the n-th letter of the alphabet translating
        into the n-th letter in some mapping with some notch that causes the
        next rotor to advance when this rotor steps from it.
        
        Internal wiring should be based on ring_setting.
        
        Rotor can either be a number from 1 to 5 to use one of the standard
        German rotors or a tuple with a custom mapping and notch.
        """
        self.ring_setting = ring_setting
        if type(rotor) == int:
            if rotor == 1:
                self.mapping, self.notch = "EKMFLGDQVZNTOWYHXUSPAIBRCJ", "Q"
            elif rotor == 2:
                self.mapping, self.notch = "AJDKSIRUXBLHWTMCQGZNPYFVOE", "E"
            elif rotor == 3:
                self.mapping, self.notch = "BDFHJLCPRTXVZNYEIWGAKMUSQO", "V"
            elif rotor == 4:
                self.mapping, self.notch = "ESOVPZJAYQUIRHXLNFTGKDCMWB", "J"
            elif rotor == 5:
                self.mapping, self.notch = "VZBRGITYUPSDNHLXAWMJQOFECK", "Z"
            else:
                raise AttributeError("Invalid rotor type " + rotor)
        else:
            self.mapping, self.notch = rotor
            
    def translate(letter, offset, forward = True):
        """Translates the given letter based on the direction
        offset, and the internal wiring of the rotor
        """
        # Your Code Here
        return "A"
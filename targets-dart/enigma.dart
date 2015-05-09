library enigma;

/// Enigma
/// ==========================
/// Sample project for Targets

const String alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

/// Represents an Enigma machine
class Enigma {
    
    Plugboard plugboard;
    Reflector reflector;
    Rotor left, middle, right;
    
    /// Creates a new Enigma machine with given 
    /// Plugboard, Reflector, and Rotors
    Enigma(this.plugboard, this.reflector, this.left, this.middle, this.right);
    
    /// Translates a message with given msgSetting.
    /// Convert all lowercase letters to uppercase.
    /// Leave non-letter characters as is.
    String translateMessage(String message, String msgSetting) {
        // Your Code Here
        return "CHANGE THIS";
    }
    
}

/// Represents the plugboard
class Plugboard {
    
    /// Default constructor
    Plugboard();
    
    /// Connects [a] with [b] on the plugboard.
    /// Assume that both [a] and [b] are single uppercase letters.
    /// Should throw an error if a==b or if either a or b is already matched.
    void addPlug(String a, String b) {
        // Your Code Here
    }
    
    /// If [input] is paired with another letter, return it.
    /// Otherwise, just return [input].
    /// Assume that [input] is a single uppercase letter.
    String translate(String input) {
        // Your Code Here
        return "A";
    }
    
}

/// Represents a reflector
class Reflector {
    
    String reflected;
    
    /// Creates a new rotor with the n-th letter of the alphabet
    /// translating into the n-th letter in [reflected]
    Reflector._(this.reflected);
    
    /// The three most common reflectors used in the M3 machine
    static final Reflector A = new Reflector._("EJMZALYXVBWFCRQUONTSPIKHGD");
    static final Reflector B = new Reflector._("YRUHQSLDPXNGOKMIEBFZCWVJAT");
    static final Reflector C = new Reflector._("FVPJIAOYEDRZXWGCTKUQSBNMHL");
    
    /// Reflects the given [input]
    String reflect(String input) {
        // Your Code Here
        return "A";
    }
    
}

/// Represents a rotor and its internal setting
class Rotor {
    
    String mapping, notch;
    int ringSetting;
    
    /// Creates a new rotor with the n-th letter of the alphabet
    /// translating into the n-th letter in [mapping];
    /// it has a notch at letter [notch] which causes the
    /// next rotor to advance when this rotor steps from it
    /// Internal wiring should be based on [ringSetting]
    Rotor.custom(this.mapping, this.notch, [this.ringSetting = 1]);
    
    /// Creates a new rotor of one of the standard types
    factory Rotor(int type, [int ringSetting = 1]) {
        String mapping;
        String notch;
        
        // Actual rotors used by the Germans in World War II
        if (type == 1) {
            mapping = "EKMFLGDQVZNTOWYHXUSPAIBRCJ";
            notch = "Q";
        } else if (type == 2) {
            mapping = "AJDKSIRUXBLHWTMCQGZNPYFVOE";
            notch = "E";
        } else if (type == 3) {
            mapping = "BDFHJLCPRTXVZNYEIWGAKMUSQO";
            notch = "V";
        } else if (type == 4) {
            mapping = "ESOVPZJAYQUIRHXLNFTGKDCMWB";
            notch = "J";
        } else if (type == 5) {
            mapping = "VZBRGITYUPSDNHLXAWMJQOFECK";
            notch = "Z";
        } else {
            throw new UnsupportedError("Invalid rotor type $type");
        }
        
        return new Rotor.custom(mapping, notch, ringSetting);
    }
    
    /// Translates the given [input] based on the direction
    /// offset, and the internal wiring of the rotor.
    String translate(String input, int offset, [bool forward = true]) {
        // Your Code Here
        return "A";
    }
    
}

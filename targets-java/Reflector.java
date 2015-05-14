/**
 * Represents a reflector
 * @author YOUR NAME HERE
 */
public class Reflector {
    
    /**
     * Creates a new rotor with the n-th letter of the alphabet 
     * translating into the n-th letter in reflected.
     * @param reflected letters to reflect to
     */
    private Reflector(String reflected) {
        // Your Code Here
    }
    
    // The three most common reflectors used in the M3 machine
    public static final Reflector A = new Reflector("EJMZALYXVBWFCRQUONTSPIKHGD");
    public static final Reflector B = new Reflector("YRUHQSLDPXNGOKMIEBFZCWVJAT");
    public static final Reflector C = new Reflector("FVPJIAOYEDRZXWGCTKUQSBNMHL");
    
    /**
     * Reflects a letter across the reflector
     * @param input uppercase letter to reflect
     * @return letter at same index in reflected as input is in alphabet
     */
    public char reflect(char input) {
        // Your Code Here
        return 'A';
    }
    
}

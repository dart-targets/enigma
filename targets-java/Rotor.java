/**
 * Represents a rotor and its internal setting
 * @author YOUR NAME HERE
 */
public class Rotor {
    
    private String mapping;
    private char notch;
    private int ringSetting;
    
    /**
     * Creates a new rotor with the n-th letter of the alphabet
     * translating into the n-th letter in mapping with a notch that
     * causes the next rotor to advance when this rotor steps from it
     * @param mapping string that maps to and from alphabet
     * @param notch letter at which the next rotor advances
     * @param ringSetting setting to base internal wiring on
     */
    public Rotor(String mapping, char notch, int ringSetting) {
        this.mapping = mapping;
        this.notch = notch;
        this.ringSetting = ringSetting;
    }
    
    /**
     * Creates a new rotor based on one of the actual rotors 
     * used by the German Army and Air Force in World War II.
     * @param type which rotor (1-5) to use
     * @param ringSetting setting to base internal wiring on
     */
    public Rotor(int type, int ringSetting) {
        if (type == 1) {
            mapping = "EKMFLGDQVZNTOWYHXUSPAIBRCJ";
            notch = 'Q';
        } else if (type == 2) {
            mapping = "AJDKSIRUXBLHWTMCQGZNPYFVOE";
            notch = 'E';
        } else if (type == 3) {
            mapping = "BDFHJLCPRTXVZNYEIWGAKMUSQO";
            notch = 'V';
        } else if (type == 4) {
            mapping = "ESOVPZJAYQUIRHXLNFTGKDCMWB";
            notch = 'J';
        } else if (type == 5) {
            mapping = "VZBRGITYUPSDNHLXAWMJQOFECK";
            notch = 'Z';
        } else {
            throw new IllegalArgumentException("Invalid rotor type " + type);
        }
        this.ringSetting = ringSetting;
    }
    
    /**
     * Translate the given input
     * @param input uppercase letter to translate
     * @param offset current outer offset
     * @param forward alphabet -> mapping if true or reverse if false
     * @return translated letter
     */
    public char translate(char input, int offset, boolean forward) {
        // Your Code Here
        return 'A';
    }
    
}

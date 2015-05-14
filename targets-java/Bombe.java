/**
 * Static methods for cracking Enigma under certain conditions
 * Do not attempt until completing Part 1!
 * @author YOUR NAME HERE
 */
public class Bombe {
    
    /**
     * Cracks Enigma under certain conditions
     * @param clear Clear text that should translate into cipher
     * @param cipher Cipher text that should translate into clear
     * @param setting initial message setting to translate between clear and cipher
     * @param leftOpts type options for the left rotor
     * @param middleOpts type options for the middle rotor
     * @param rightOpts type options for the right rotor
     * @param reflOpts options for the reflector
     * @return a valid Enigma that translates clear into cipher and vice-versa
     */
    public static Enigma crackCode(String clear, String cipher, String setting, 
            int[] leftOpts, int[] middleOpts, int[] rightOpts, Reflector[] reflOpts) {    
        // Your Code Here
        return null;
    }
    
    /**
     * Finds a plugboard for the given configuration if any exists
     * You may assume that the plugboard used to create the ciphertext had 10 plugs
     * @param left Left rotor to use
     * @param middle Middle rotor to use
     * @param right Right rotor to use
     * @param reflect Reflector to use
     * @param clear Clear text that should translate into cipher
     * @param cipher Cipher text that should translate into clear
     * @param setting intial message setting to translate between clear and cipher
     * @return a valid Plugboard for this configuration or null if none exists
     */
    public static Plugboard findPlugboard(Rotor left, Rotor middle, Rotor right, 
            Reflector reflect, String clear, String cipher, String setting) {
        // Your Code Here
        return null;
    }
    
}

import java.util.Random;
import java.util.List;
import java.util.ArrayList;
import java.util.Collections;

/**
 * Tests student code for the Enigma project
 * @author Jack Thakar
 */
public class TestEnigma {
    
    /**
     * Runs tests (should be run with `targets check`)
     * @param args which test to run
     */
    public static void main(String[] args) {
        if (args[0].equals("plugboard")) {
            Plugboard p = new Plugboard();
            p.addPlug('A', 'Z');
            p.addPlug('R', 'Q');
            p.addPlug('S', 'E');
            String output = "";
            output += p.translate('Z');
            output += p.translate('P');
            output += p.translate('S');
            output += p.translate('Q');
            output += p.translate('A');
            String expect = "APERZ";
            if (!output.equals(expect)) {
                System.out.print("Expected " + expect + ", got " + output);
            }
        } else if (args[0].equals("simple")) {
            Plugboard p = new Plugboard();
            Rotor left = new Rotor(1, 1);
            Rotor middle = new Rotor(2, 1);
            Rotor right = new Rotor(3, 1);
            Enigma enigma = new Enigma(p, Reflector.B, left, middle, right);
            String input  = "TARGETS";
            String output = enigma.translateMessage(input, "AAA");
            String expect = "ODXARRV";
            if (!output.equals(expect)) {
                System.out.print("Expected " + expect + ", got " + output);
            }
        } else if (args[0].equals("moderate")) {
            Plugboard p = new Plugboard();
            p.addPlug('A', 'Z');
            p.addPlug('X', 'D');
            p.addPlug('M', 'V');
            Rotor left = new Rotor(4, 1);
            Rotor middle = new Rotor(5, 5);
            Rotor right = new Rotor(1, 1);
            Enigma enigma = new Enigma(p, Reflector.C, left, middle, right);
            String input  = "TARGETS";
            String expect = "MGDUGBF";
            String output = enigma.translateMessage(input, "AAA");
            if (!output.equals(expect)) {
                System.out.print("Expected " + expect + ", got " + output);
            }
        } else if (args[0].equals("complex")) {
            Plugboard p = new Plugboard();
            p.addPlug('A', 'Z');
            p.addPlug('X', 'D');
            p.addPlug('M', 'V');
            p.addPlug('E', 'F');
            Rotor left = new Rotor(4, 7);
            Rotor middle = new Rotor(5, 3);
            Rotor right = new Rotor(1, 14);
            Enigma enigma = new Enigma(p, Reflector.C, left, middle, right);
            String input  = "TARGETS";
            String expect = "NDMKPXM";
            String output = enigma.translateMessage(input, "MZN");
            if (!output.equals(expect)) {
                System.out.print("Expected " + expect + ", got " + output);
            }
        } else if (args[0].equals("bombe_plug")) {
            Plugboard p = randomPlugboard();
            Rotor[] rotors = randomRotors();
            Reflector r = randomReflector();
            Enigma enigma = new Enigma(p, r, rotors[0], rotors[1], rotors[2]);
            String msgSetting = randomMessageSetting();
            String output = enigma.translateMessage(cleartext, msgSetting);
            Plugboard found = Bombe.findPlugboard(rotors[0], rotors[1], 
                rotors[2], r, cleartext, output, msgSetting);
            if (found == null) {
                System.out.print("findPlugboard returned null");
                return;
            }
            Enigma crack = new Enigma(found, r, rotors[0], rotors[1], rotors[2]);
            String decrypt = crack.translateMessage(output, msgSetting);
            if (cleartext != decrypt) {
                System.out.print("Incorrect plugboard");
            }
        } else if (args[0].equals("bombe")) {
            Plugboard p = randomPlugboard();
            int[] rotors = getThreeRandomInts();
            Rotor left = new Rotor(rotors[0], new Random().nextInt(26) + 1);
            Rotor middle = new Rotor(rotors[1], new Random().nextInt(26) + 1);
            Rotor right = new Rotor(rotors[2], new Random().nextInt(26) + 1);
            Reflector refl = randomReflector();
            
            Enigma enigma = new Enigma(p, refl, left, middle, right);
            String msgSetting = randomMessageSetting();
            String output = enigma.translateMessage(cleartext, msgSetting);
            Enigma crack = Bombe.crackCode(cleartext, output, msgSetting, 
                            new int[]{rotors[0]}, new int[]{rotors[1]},
                            new int[]{rotors[2]}, new Reflector[]{refl});
            if (crack == null) {
                System.out.print("crackCode returned null");
                return;
            }
            String decrypt = crack.translateMessage(output, msgSetting);
            if (cleartext != decrypt) {
                System.out.print("Incorrect Enigma configuration");
            }
        }
    }
    
    private static int[] getThreeRandomInts() {
        int a = new Random().nextInt(5) + 1;
        int b = a;
        while (b == a) b = new Random().nextInt(5) + 1;
        int c = b;
        while (c == a || c == b) c = new Random().nextInt(5) + 1;
        return new int[]{a, b, c};
    }
    
    private static Plugboard randomPlugboard() {
        List<Character> letters = new ArrayList<Character>();
        for (char c : "ABCDEFGHIJKLMNOPQRSTUVWXYZ".toCharArray()) letters.add(c);
        Collections.shuffle(letters);
        Plugboard p = new Plugboard();
        for (int i = 0; i < 20; i += 2) {
            p.addPlug(letters.get(i), letters.get(i + 1));
        }
        return p;
    }
    
    private static Rotor[] randomRotors() {
        Rotor[] rotors = new Rotor[3];
        int[] types = getThreeRandomInts();
        rotors[0] = new Rotor(types[0], new Random().nextInt(26) + 1);
        rotors[1] = new Rotor(types[1], new Random().nextInt(26) + 1);
        rotors[2] = new Rotor(types[2], new Random().nextInt(26) + 1);
        return rotors;
    }
    
    private static Reflector randomReflector() {
        int option = new Random().nextInt(3);
        if (option == 0) return Reflector.A;
        if (option == 1) return Reflector.B;
        return Reflector.C;
    }
    
    private static String randomMessageSetting() {
        String setting = "";
        String alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        for (int i = 0; i < 3; i++) {
            setting += alphabet.charAt(new Random().nextInt(26));
        }
        return setting;
    }

    private static final String cleartext = "NOBODYEXPECTSTHESPANISHINQUISITION";
    
}
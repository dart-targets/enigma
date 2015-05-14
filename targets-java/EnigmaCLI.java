import java.util.Scanner;

/**
 * Simple CLI for Enigma
 * @author Jack Thakar
 */
public class EnigmaCLI {
    
    /**
     * Usage:
     * java EnigmaCLI [left rotor #]   [left ring setting]
     *                [middle rotor #] [middle ring setting]
     *                [right rotor #]  [right ring setting]
     *                [reflector type] [plugboard pair] [plugboard pair]...
     * Default settings are rotors 1, 2, and 3 all with ring setting 1, reflector B, and no plugs
     * For each line of input, start with the three letter message setting,
     * then a space, and then the actual contents of your message.
     * Lowercase letters will be converted to capital letters; non-letters will be left as is
     */
    public static void main(String[] args) {
        int leftType = 1;
        int leftRing = 1;
        int middleType = 2;
        int middleRing = 1;
        int rightType = 3;
        int rightRing = 1;
        Reflector reflector = Reflector.B;
        Plugboard p = new Plugboard();
        if (args.length >= 7) {
            leftType = Integer.parseInt(args[0]);
            leftRing = Integer.parseInt(args[1]);
            middleType = Integer.parseInt(args[2]);
            middleRing = Integer.parseInt(args[3]);
            rightType = Integer.parseInt(args[4]);
            rightRing = Integer.parseInt(args[5]);
            String r = args[6];
            if (r.equals("A")) reflector = Reflector.A;
            if (r.equals("B")) reflector = Reflector.B;
            if (r.equals("C")) reflector = Reflector.C;
            for (int i = 7; i < args.length; i++) {
                String letters = args[i].toUpperCase();
                p.addPlug(letters.charAt(0), letters.charAt(1));
            }
        }
        Rotor left = new Rotor(leftType, leftRing);
        Rotor middle = new Rotor(middleType, middleRing);
        Rotor right = new Rotor(rightType, rightRing);
        Enigma enigma = new Enigma(p, reflector, left, middle, right);
        Scanner scan = new Scanner(System.in);
        while (scan.hasNextLine()) {
            String line = scan.nextLine().toUpperCase();
            String setting = line.split(" ")[0];
            String message = line.substring(setting.length() + 1);
            String encoded = enigma.translateMessage(message, setting);
            System.out.println(encoded);
        }
    }

}

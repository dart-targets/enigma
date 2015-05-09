/// Basic command line interface for Enigma
/// Usage:
/// dart enigmacli.dart [left rotor #] [left ring setting] 
///                     [middle rotor #] [middle ring setting]
///                     [right rotor #] [right ring setting] 
///                     [reflector type] [plugboard pair] [plugboard pair]...
/// Default settings are rotors 1, 2, and 3 all with ring setting 1, reflector B, and no plugs
/// For each line of input, start with the three letter message setting,
/// then a space, and then the actual contents of your message
/// Lowercase letters will be converted to capital letters; non-letters will be left as is
import 'dart:io';
import 'dart:convert';

import 'enigma.dart';


void main(args) async {
    Rotor left = new Rotor(1, 1);
    Rotor middle = new Rotor(2, 1);
    Rotor right = new Rotor(3, 1);
    Reflector reflector = Reflector.B;
    Plugboard p = new Plugboard();
    if (args.length >= 7) {
        left = new Rotor(int.parse(args[0]), int.parse(args[1]));
        middle = new Rotor(int.parse(args[2]), int.parse(args[3]));
        right = new Rotor(int.parse(args[4]), int.parse(args[5]));
        String r = args[6].toUpperCase();
        if (r == "A") reflector = Reflector.A;
        if (r == "B") reflector = Reflector.B;
        if (r == "C") reflector = Reflector.C;
        for (int i = 7; i < args.length; i++) {
            var parts = args[i].toUpperCase().split("");
            p.addPlug(parts[0], parts[1]);
        }
    }
    Enigma enigma = new Enigma(p, reflector, left, middle, right);
    var lines = stdin.transform(UTF8.decoder).transform(new LineSplitter());
    await for (String line in lines) {
        line = line.toUpperCase();
        var parts = line.split(" ");
        String setting = parts[0];
        String message = line.substring(setting.length + 1);
        String encoded = enigma.translateMessage(message, setting);
        print(encoded);
    }
}
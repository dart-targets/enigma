/// All lines with starting with /// (no whitespace) will be removed from 
/// the version of this file that "targets get" downloads for students.
/// Any other comments (//, /*, or /**) will remain.
/// Indented /// comments will also remain.
/// The following message will be displayed to students unless you remove it.
/// 
// This file is used to run tests on your code before you submit it.
// To test your code, run "targets check" in the main directory
// Your instructor may run additional tests on your code after you submit it.
// Test results based on this file are not shared with your instructor,
// so changing it will not help your grade. If this file becomes corrupted,
// you will have to redownload the assigment template.
/// 
/// This imports the Target classes (ScoredTarget and TestTarget)
import 'helpers.dart';

/// Import necessary files to test here
import '../enigma.dart';
import '../bombe.dart' as Bombe;
/// Use ../ as actual assignment code should be in the parent directory

import 'dart:math';
import 'dart:io';

/// Name displayed to students when running the autograder
/// This is not required, only the owner, id, and repo
/// are actually sent to server with student code
final String name = "Enigma Project - Dart";

/// Your GitHub username or organization name
/// You'll have to log in with GitHub to access
/// submissions of this project
final String owner = "dart-targets";

/// Assignment id
/// Template is live at:
/// https://github.com/dart-targets/enigma/targets-dart
/// Download with:
/// targets get dart-targets/enigma/dart
/// To submit to a teacher use:
/// targets get [teacher]:dart-targets/enigma/dart
final String id = "enigma-dart";

/// This list should contain the files that should be submitted for grading.
final List<String> files = ["enigma.dart", "bombe.dart"];

/// This function should return a list of Target
/// objects that you want to be run for grading.
/// 
/// TestTarget does not count for points, but can be
/// helpful for students in debugging their code.
/// The test method of a TestTarget should return true or false.
/// 
/// ScoredTarget counts for the specified number of points.
/// The test method can return a number, true, or false.
/// Numbers count as the score on that target, true counts
/// as full credit, and false counts as no credit.
/// 
/// Tests that cause an error or return anything else will count as 
/// failed or no credit; errors will be displayed to students.
/// 
/// Students will be able to read this file, so don't include
/// completed implementations as part of your tests. You can
/// use a different tests.dart for tests you run on submissions.
List<Target> getTargets() {
    var plug = new TestTarget("Plugboard");
    plug.test = (){
        Plugboard p = new Plugboard();
        p.addPlug("A", "Z");
        p.addPlug("R", "Q");
        p.addPlug("S", "E");
        String output = "";
        output += p.translate("Z");
        output += p.translate("P");
        output += p.translate("S");
        output += p.translate("Q");
        output += p.translate("A");
        return output == "APERZ";
    };
    var test1 = new TestTarget("Single Enigma");
    test1.test = (){
        Plugboard p = new Plugboard();
        Rotor left = new Rotor(1, 1);
        Rotor middle = new Rotor(2, 1);
        Rotor right = new Rotor(3, 1);
        Enigma enigma = new Enigma(p, Reflector.B, left, middle, right);
        String input  = "TARGETS";
        String expect = "ODXARRV";
        String output = enigma.translateMessage(input, "AAA");
        if (output != expect) {
            test1.error = "Expected $expect; got $output";
        }
        return output == expect;
    };    
    var test2 = new TestTarget("Moderate Enigma");
    test2.test = (){
        Plugboard p = new Plugboard();
        p.addPlug("A", "Z");
        p.addPlug("X", "D");
        p.addPlug("M", "V");
        Rotor left = new Rotor(4, 1);
        Rotor middle = new Rotor(5, 5);
        Rotor right = new Rotor(1, 1);
        Enigma enigma = new Enigma(p, Reflector.C, left, middle, right);
        String input  = "TARGETS";
        String expect = "MGDUGBF";
        String output = enigma.translateMessage(input, "AAA");
        if (output != expect) {
            test2.error = "Expected $expect; got $output";
        }
        return output == expect;
    };
    var test3 = new TestTarget("Complex Enigma");
    test3.test = (){
        Plugboard p = new Plugboard();
        p.addPlug("A", "Z");
        p.addPlug("X", "D");
        p.addPlug("M", "V");
        p.addPlug("E", "F");
        Rotor left = new Rotor(4, 7);
        Rotor middle = new Rotor(5, 3);
        Rotor right = new Rotor(1, 14);
        Enigma enigma = new Enigma(p, Reflector.C, left, middle, right);
        String input  = "TARGETS";
        String expect = "NDMKPXM";
        String output = enigma.translateMessage(input, "MZN");
        if (output != expect) {
            test3.error = "Expected $expect; got $output";
        }
        return output == expect;
    };
    var simple = new TestTarget("Bombe Plugboard");
    simple.test = (){
        Plugboard p = randomPlugboard();
        List<Rotor> rotors = randomRotors();
        Reflector r = randomReflector();
        Enigma enigma = new Enigma(p, r, rotors[0], rotors[1], rotors[2]);
        String msgSetting = randomMessageSetting();
        String output = enigma.translateMessage(cleartext, msgSetting);
        int start = new DateTime.now().millisecondsSinceEpoch;
        Plugboard found = Bombe.findPlugboard(rotors[0], rotors[1], 
            rotors[2], r, cleartext, output, msgSetting);
        int end = new DateTime.now().millisecondsSinceEpoch;
        if (found == null) {
            simple.error = "findPlugboard returned null - ${(end-start)/1000.0}s";
            return false;
        }
        Enigma crack = new Enigma(found, r, rotors[0], rotors[1], rotors[2]);
        String decrypt = crack.translateMessage(output, msgSetting);
        if (cleartext != decrypt) {
            simple.error = "Expected $expect; got $output - ${(end-start)/1000.0}s";
        } simple.error = "${(end-start)/1000.0}s";
        return cleartext == decrypt;
    };
    var bombe = new TestTarget("Full Bombe");
    bombe.test = (){
        Plugboard p = randomPlugboard();
        List<int> rotors = [1, 2, 3, 4, 5]..shuffle();
        Rotor left = new Rotor(rotors[0], new Random().nextInt(26) + 1);
        Rotor middle = new Rotor(rotors[1], new Random().nextInt(26) + 1);
        Rotor right = new Rotor(rotors[2], new Random().nextInt(26) + 1);
        Reflector refl = randomReflector();
        
        Enigma enigma = new Enigma(p, refl, left, middle, right);
        String msgSetting = randomMessageSetting();
        String output = enigma.translateMessage(cleartext, msgSetting);
        int start = new DateTime.now().millisecondsSinceEpoch;
        Enigma crack = Bombe.crackCode(cleartext, output, msgSetting, 
                        [rotors[0]], [rotors[1]], [rotors[2]], [refl]);
        int end = new DateTime.now().millisecondsSinceEpoch;
        if (crack == null) {
            bombe.error = "crackCode returned null - ${(end-start)/1000.0}s";
            return false;
        }
        String decrypt = crack.translateMessage(output, msgSetting);
        if (cleartext != decrypt) {
            bombe.error = "Expected $cleartext; got $decrypt - ${(end-start)/1000.0}s";
        } else bombe.error = "${(end-start)/1000.0}s";
        return cleartext == decrypt;
    };
    return [plug, test1, test2, test3, simple, bombe];
}

Plugboard randomPlugboard() {
    List<String> letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split("");
    letters.shuffle();
    Plugboard p = new Plugboard();
    for (int i = 0; i < 20; i += 2) {
        p.addPlug(letters[i], letters[i + 1]);
    }
    return p;
}

List<Rotor> randomRotors() {
    List<Rotor> rotors = [];
    var types = [1, 2, 3, 4, 5]..shuffle();
    for (int i = 0; i < 3; i++) {
        rotors.add(new Rotor(types[i], new Random().nextInt(26) + 1));
    }
    return rotors;
}

Reflector randomReflector() {
    var refl = [Reflector.A, Reflector.B, Reflector.C]..shuffle();
    return refl[0];
}

String randomMessageSetting() {
    String setting = "";
    String alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    for (int i = 0; i < 3; i++) {
        setting += alphabet[new Random().nextInt(26)];
    }
    return setting;
}

const String cleartext = "NOBODYEXPECTSTHESPANISHINQUISITION";


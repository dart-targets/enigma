// This file is used to run tests on your code before you submit it.
// To test your code, run "targets check" in the main directory
// Your instructor may run additional tests on your code after you submit it.
// Test results based on this file are not shared with your instructor,
// so changing it will not help your grade. If this file becomes corrupted,
// you will have to redownload the assigment template.
import 'helpers.dart';

final String name = "Enigma Project - Java";

final String owner = "dart-targets";

final String id = "enigma-java";

/// Ensures consistent ordering of files everyone submits
/// ! Exclusions must be after the * wildcard
final List<String> files = ["Enigma.java", "Plugboard.java", "Reflector.java", 
    "Rotor.java", "Bombe.java", "*.java", "!TestEnigma.java", "!EnigmaCLI.java"];

List<Target> getTargets(){
    InputOutput io0 = new InputOutput.withArgs("Plugboard", "plugboard", "APERZ");
    InputOutput io1 = new InputOutput.withArgs("Simple Enigma", "simple", "ODXARRV");
    InputOutput io2 = new InputOutput.withArgs("Moderate Enigma", "moderate", "MGDUGBF");
    InputOutput io3 = new InputOutput.withArgs("Complex Enigma", "complex", "NDMKPXM");
    InputOutput io4 = new InputOutput.withArgs("Bombe Plugboard", "bombe_plug", "");
    InputOutput io5 = new InputOutput.withArgs("Full Bombe", "bombe", "");
    return IOTarget.makeMultiJava("TestEnigma", [io0, io1, io2, io3, io4, io5]);
}

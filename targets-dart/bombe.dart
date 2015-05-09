library bombe;

import 'enigma.dart';


/// Returns a valid Enigma that translates [clear] into [cipher]
/// and vice-versa when [setting] is used as message setting
/// Select only from the provided options for rotors and reflectors
/// Returns null if no such Engima exists
Enigma crackCode(String clear, String cipher, String setting, List<int> leftOpts, 
        List<int> middleOpts, List<int> rightOpts, List<Reflector> reflOpts) {
    // Your Code Here
    return null;
}

/// Returns a valid Plugboard for the given Enigma components
/// Returns null if no such Plugboard exists
Plugboard findPlugboard(left, middle, right, reflect, clear, cipher, setting) {
    // Your Code Here
    return null;
}

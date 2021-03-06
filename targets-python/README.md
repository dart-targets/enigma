## Engima ##

This is a sample assignment to demonstrate Targets

Download with:

    targets get dart-targets/enigma/python
    
Or with teacher "dart-targets" and assignment ID "enigma/dart" in the web console.
If submitting to a teacher, they should direct you to use an alternate ID.

This assignment template is also available in [Dart](https://github.com/dart-targets/enigma/tree/master/targets-dart) and [Java](https://github.com/dart-targets/enigma/tree/master/targets-java).

### Overview ###

During World War II, the Nazis used a machine called Enigma to encode and decode secret messages. They believed that the code was unbreakable, but unbeknownst to them, [Alan Turing](http://en.wikipedia.org/wiki/Alan_Turing) and a team of cryptographers were able to crack it, significantly shortening the length of the war and saving millions of lives.

In this project, you'll first write a simulator of the M3 Enigma machine (used by the Nazi Army and Air Force) in `enigma.py`. Once you've completed this and passed the first four Targets tests, you'll then try to break Enigma in `bombe.py`. All provided tests are pass/fail only and are designed to guide you in your completion of the assignment. If submitting to a teacher, they will run their own tests and grade accordingly. Passing the included tests does not guarantee full credit.

### Requirements and Setup ###

This assignment and its tests were designed with Python 3 in mind. However, I believe that it should work with Python 2.7 as well. If you're completing this assignment for a class, make sure to follow your teacher's instructions about which version to use, as while the skeleton code should be compatible with either, your completed assignment will most likely only be compatible with the version you use.

Before beginning this assigment, you should modify line 10 in `targets/tests.dart`, replacing `python` with whatever command you use to run Python (preferably Python 3) from the command line.

### Part 1: Enigma ###

Before you can actually begin building an Enigma machine, you need to understand how it works.

First, watch [this video](https://www.youtube.com/watch?v=G2_Q9FoD-oQ) by Numberphile explaining the basics of the machine. Numberphile's video doesn't get into the ring setting, which is important if we want to build an accurate Enigma simulator. Watch from to 11:12 to 14:54 in [this video](https://youtu.be/d2NWPG2gB_A?t=11m12s) by Computerphile for an explanation of the ring setting and some other complications in the Enigma machine. You might find the rest of the video helpful as well.

This part of the assignment contains a considerable amount of skeleton code. You should not delete or otherwise modify the existing methods in `enigma.py`, as doing so could break the tests. You may, however, add additional functions and classes as needed. Four classes are provided to you: `Enigma`, `Plugboard`, `Rotor`, and `Reflector`. You are responsible for writing the following methods:

- `Enigma.translate_message(message, setting)` - Takes in a message to encode as well as the inital wheel positions for each rotor. This is provided as a string of three letters, with the first letter for the left rotor, the second for the middle rotor, and the third for the right rotor.
- `Plugboard.add_plug(a, b)` and `translate(letter)` - You'll need to complete this and add to the Plugboard class so that you can keep track if which letters are connected on the plugboard.
- `Reflector.reflect(letter)` - There are three reflectors (A, B, and C) where each letter in the alphabet is mapped to a corresponding letter in `reflected`
- `Rotor.translate(letter, offset, forward)` - This is probably the most complicated method. Rotors are created with a `ringSetting` where 1 is the default (i.e. no change from straightforward mappings). You may want to normalize this to make the default 0 (Enigma was mechanical and used 1-indexed values, while 0-indexing is easier when programming). `offset` is based on the wheel position of the rotor at this time, where a wheel position of `A` is an offset of `0`. Input should be offset by the difference between the offset and the normalized ring setting before mapping while output should then be offset by the difference between the normalized ring setting and the offset after mapping. If `forward` is true, the mappings should be from the alphabet to `mappings`, but if `forward` is false, the mappings should be from `mappings` to the alphabet.

Rotors should be rotated *before* each letter is translated. Here are the rules for rotation:

- The right rotor should always rotate by one spot (e.g. if the rotor is currently set to `B`, it would rotate to `C`)
- If the right rotor is rotating from its notch, the middle rotor should also rotate. In this case, if the middle rotor is also rotating from its notch, the left rotor should also rotate.
- Even if the right rotor is not rotating from its notch, if the middle rotor is currently at its notch, both the middle and left rotors should rotate.

The path of a single letter through the machine should be as follows:

1. Through the plugboard
2. Forward through the right rotor
3. Forward through the middle rotor
4. Forward through the left rotor
5. Through the reflector
6. Backward through the left rotor
7. Backward through the middle rotor
8. Backward through the right rotor
9. Through the plugboard

Three tests of translating a message, as well as one test of the plugboard, are included when running `targets check` (or clicking the **Run Tests** button in the web console). All three message tests encode the message `TARGETS` with various Enigma settings. Ignore the Bombe tests when completing this part.

To assist you in manually testing your Enigma, a command line interface has been provided in `enigmacli.py`. See the comments at the start of the file for usage instructions.

### Part 2: Bombe ###

Make sure to complete Part 1 before moving on to Part 2. Both your code and the tests for this part rely on your Enigma simulator working.

This part of the project will be much more freeform. As an overview of some of the flaws in Enigma and some strategies for breaking it, see [this video](https://www.youtube.com/watch?v=V4V2bpZlqx8) (again by Numberphile). You may also find the [second Computerphile video](https://www.youtube.com/watch?v=kj_7Jc1mS9k) on Enigma helpful as well. Computerphile mentions that the Naval Enigma was much harder to break. Luckily, the Enigma you built in Part 1 was based on the simpler Army and Air Force Enigma, so your task here is easier.

You should complete two functions in this part: `crack_code` and `find_plugboard`. `find_plugboard` will be the difficult part, and will almost certainly require additional functions and/or classes to complete. Once you've confirmed that `find_plugboard` works (i.e. you pass the "Bombe Plugboard" Targets test), you should be able to complete `crack_code` easily using it. You can and should brute-force all of the rotor settings in `crack_code`, but doing so with `find_plugboard` is not practical as it would then take hours to crack the code even on very fast, modern machines (for comparison, the Bombes used in World War II took around 20 minutes to crack a typical Enigma code). Timing will vary for both the "Bombe Plugboard" and the "Full Bombe" tests due to both randomized input and the speed of your particular machine. My solution on my machine (Broadwell i5 2.2Ghz processor) usually takes a second or two to run the "Full Bombe" test (my solution is in another language, but Python should be or comparable speed).

Complete `crack_code(message, msgSetting, startsWith)` which takes in an encrypted message, the wheel settings used to create it, and some cleartext that the message is known to start with. `crack_code` should return an Enigma object identical to the one used to encrypt the message (i.e. calling `translateMessage` on this instance of Enigma with the provided encrypted message and message setting should yield the original cleartext message).

In short, you should not be waiting more than a second or two to run the "Full Bombe" test and you *definitely* should not be attempt to brute-force all 159 quintillion possibilities.

<!-- Not ready yet
If you're stuck on how to approach `find_plugboard`, you may find it helpful to work out some strategies by hand and then apply them to your code. I've developed a [puzzle generator](https://jackthakar.com/enigma/puzzle) based on my solutions to Part 1 that you may find useful (it also provides some strategies for solving by hand). -->

Your teacher may either include this as part of the core assignment or make it extra credit.

### Submission ###

If you are not completing this assignment for a teacher, you have no one to submit it to (Targets blocks any submissions made to the `dart-targets` GitHub organization).

If you are submitting to a teacher, you should make sure that all of your code is contained in either `enigma.py` or `bombe.py`. If you do need to include any other files, make sure to add them to the `files` list in `targets/tests.dart` (not recommended). You should see all of the code you're submitting on the verification page. Any code not on this page will not be submitted.



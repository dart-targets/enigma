## Enigma ##

This is a sample project for [Targets](https://github.com/dart-targets/targets), an assignment manager and simple autograder intended for high school CS classes.

The template for this sample is provided in three languages: [Dart][dart], [Java][java], and [Python][python]. Please see the individual README in the corresponding folder for specifics about the project in that language.

You can download the template in your preferred language using Targets with:

    targets get dart-targets/enigma/dart
    targets get dart-targets/enigma/java
    targets get dart-targets/enigma/python
    
If you're using the web console, `dart-targets` is the teacher name and `enigma/LANG` is the assignment name (replacing `LANG` with `dart`, `java`, or `python`). If you want to be able to submit your completed project to a teacher, use `TEACHER:dart-targets` as the teacher name (replacing `TEACHER` with your teacher's GitHub username).

Because I actually want this assignment to be available to teachers if they want to use it, I am not publicly releasing solutions. [Contact me](mailto:jack@jackthakar.com) if you're a teacher who would like to see the solutions.

### Overview ###

This project consists of two parts. In Part 1, students write a simulator for the M3 Enigma machine used by the German Army and Air Force during World War II. In Part 2, students then attempt to break the Enigma code under certain conditions. Specific implementation details vary based on the constraints and features of each language, but in general, students should be familiar with object-orientated programming and string manipulation in the language they're using.

Part 1 is designed so that students near the end of a typical intro high school CS course or about halfway through a semester of intro college CS should be able to complete it. This of course varies dramatically depending on the course, so teachers should review the version of the project in their class's language before assigning it. In this part, students are guided toward a solution with plenty of skeleton code.

Part 2 is less structured and requires significant logical reasoning before even attempting a solution. Students will need to design a system to efficiently determine the wiring of the plugboard of a given Enigma machine. Teachers may want to consider making this part extra credit depending on the level of their class. Students can significantly improve the practical speed of their solution in Part 2 through use of isolates (in Dart), threading (in Java), or multiprocessing (in Python) but the included tests should run in seconds on efficient code even without these. If you wish to require the use of concurrency, you'll want to fork this project and add additional tests that require the speed improvements that these provide.

### Requirements ###

Targets requires Dart 1.8. This particular assignment requires 0.7.9+ of Targets. You can install/update Targets with `pub global activate targets` provided the Dart SDK is installed on your path. You may need to put Pub's cache on your path in order to use the `targets` command. Pub should direct you to do this. Alternatively, you can replace any instance of the `targets` command with `pub global run targets`.

The Dart version of the template was written with Dart 1.9 in mind. Most of the assignment should work with Dart 1.8, but `enigmacli.dart` uses async/await and requires Dart 1.9.

The Java version of the template was written with JDK 1.7 in mind. It should work with JDK 1.6 as well, but I haven't tested it.

The Python version of the template was written with Python 3 in mind, but the template should work with Python 2.7 as well.

### Additional Languages ###

I've provided templates for this assignment in Dart, Java, and Python because Targets itself is written in Dart and Java and Python are both common languages for teaching CS. I intend to port any future assignments of this size to these three languages as well.

However, you are welcome to contribute templates in additional languages. If you want to port this assignment to another language, submit a pull request. New ports will be approved provided functionality and tests closely resemble those for one of the existing three langauges. Make sure to test `targets get` and `targets check` on the port before submitting your pull request.

[dart]: https://github.com/dart-targets/enigma/tree/master/targets-dart
[java]: https://github.com/dart-targets/enigma/tree/master/targets-java
[python]: https://github.com/dart-targets/enigma/tree/master/targets-python
Java Hello World Example wit TestNG
===================================

This is a Java "Hello World" example with TestNG

The ``HelloWorld`` package structure is ::

  |-- HelloWorld
  |   `-- HelloWorld.java
  |   `-- TestHelloWorld.java
  |-- lib
  |-- testng.xml
  |-- Manifest.txt
  `-- README.md

Compile HelloWorld class
------------------------

Compile the HelloWorld main class ::

 javac HelloWorld/HelloWorld.java

Generates the ``HelloWorld.class`` file in the ``HelloWorld`` directory

Run HelloWorld class
--------------------

For run the main class for package, execute the follow command ::

 java -cp . HelloWorld.Main

Prints the ``Hello world`` message to stdout

To create a JAR file
--------------------

Generate the HelloWorld.jar file ::

 jar cfme HelloWorld/HelloWorld.jar Manifest.txt HelloWorld.HelloWorld HelloWorld/HelloWorld.class

Generates the ``HelloWorld.jar`` file in the ``HelloWorld`` directory


Run the JAR file
----------------

Run the HelloWorld.jar file ::

 java -jar HelloWorld/HelloWorld.jar


This show the ``Hello world`` message.



Compile TestHelloWorld class
----------------------------

Compile the TestHelloWorld main class ::

 javac -cp .:lib/* HelloWorld/TestHelloWorld.java

Generates the ``TestHelloWorld.class`` file in the ``HelloWorld`` directory


Run the HelloWorld TestNG
-------------------------

generate the TestNg "test-output" directory and files ::

 java -cp ".:HelloWorld:lib/*" org.testng.TestNG testng.xml

Creates the TestNg "test-output" directory and files

#!/bin/bash

rm -rf test-output
rm -f HelloWorld/*.class
rm -f HelloWorld/*.jar
#exit 0

echo
echo "Compile HelloWorld/HelloWorld.java"
javac HelloWorld/HelloWorld.java

echo
echo "Run HelloWorld main class"
java -cp . HelloWorld.HelloWorld

echo
echo "Create JAR file"
jar cfme HelloWorld/HelloWorld.jar Manifest.txt HelloWorld.HelloWorld HelloWorld/HelloWorld.class

echo
echo "Run the HelloWorld.jar file"
java -jar HelloWorld/HelloWorld.jar


echo
echo "Compile HelloWorld/TestHelloWorld.java"
javac -cp .:lib/* HelloWorld/TestHelloWorld.java

echo
echo "Run the HelloWorld TestNG"
#java -cp "path-tojar/testng.jar:path_to_yourtest_classes" org.testng.TestNG testng.xml
java -cp ".:HelloWorld:lib/*" org.testng.TestNG testng.xml


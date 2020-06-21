#!/bin/bash

rm -rf test-output
rm -f com/helloworld/*.class
rm -f com/helloworld/*.jar
#exit 0

echo
echo "Compile HelloWorld/HelloWorld.java"
javac com/helloworld/HelloWorld.java

echo
echo "Run HelloWorld main class"
java com.helloworld.HelloWorld

echo
echo "Create JAR file"
jar cfme com/helloworld/HelloWorld.jar Manifest.txt com.helloworld.HelloWorld com/helloworld/HelloWorld.class

echo
echo "Run the HelloWorld.jar file"
java -jar com/helloworld/HelloWorld.jar


echo
echo "Compile HelloWorld/TestHelloWorld.java"
javac -cp .:lib/* com/helloworld/TestHelloWorld.java

echo
echo "Run the HelloWorld TestNG"
#java -cp "path-tojar/testng.jar:path_to_yourtest_classes" org.testng.TestNG testng.xml
java -cp ".:com/helloworld:lib/*" org.testng.TestNG testng.xml


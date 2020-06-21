#!/bin/bash

if [ -z $1 ]; then
  echo "Error: missing arg1"
  echo "$0: build|test|deploy"
  exit 1
fi

if [ "$1" != "build" -a "$1" != "test" -a "$1" != "deploy" ]; then
  echo "Error: arg1 must be \"build\", \"test\" or \"deploy\""
  exit 1
fi

do_build() {
  rm -f com/helloworld/*.class com/helloworld/*.jar

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
}

do_test() {
  rm -rf test-output

  echo
  echo "Compile HelloWorld/TestHelloWorld.java"
  javac -cp .:lib/* com/helloworld/TestHelloWorld.java

  echo
  echo "Run the HelloWorld TestNG"
  java -cp ".:com/helloworld:lib/*" org.testng.TestNG testng.xml
}

do_deploy() {
  echo
  echo "Deploy HelloWorld.jar to /tmp"

  cp ./com/helloworld/HelloWorld.jar /tmp

  echo "Run the deployed /tmp/HelloWorld.jar file"
  java -jar /tmp/HelloWorld.jar

}

if [ "$1" = "build" ]; then
  do_build
  exit $?
fi

if [ "$1" = "test" ]; then
  do_build
  exit $?
fi

if [ "$1" = "deploy" ]; then
  do_deploy
  exit $?
fi

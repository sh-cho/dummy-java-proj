#!/bin/bash

SCRIPT_DIR=$(cd $(dirname "$0"); pwd)
APP_HOME=$(cd "$SCRIPT_DIR/.."; pwd)

echo "> 현재 구동중인 애플리케이션 pid 확인"

CURRENT_PID=$(pgrep -f 'dummy-java-proj-0.0.1-SNAPSHOT.jar')

echo "$CURRENT_PID"

if [ -z "$CURRENT_PID" ]; then
    echo "> 현재 구동중인 애플리케이션이 없으므로 종료하지 않습니다."
else
    echo "> kill -TERM $CURRENT_PID"
    kill -TERM "$CURRENT_PID"
    sleep 5
fi

echo "> 새 어플리케이션 배포"

echo "> Build 파일 복사"

mkdir -p "$APP_HOME/jar/"

cp "$APP_HOME"/build/libs/*.jar "$APP_HOME/jar/"

#JAR_NAME=$(ls $REPOSITORY/jar/ | grep 'dummy-java-proj-0.0.1-SNAPSHOT.jar' | tail -n 1)

#echo "> JAR Name: $JAR_NAME"

nohup java -jar "$APP_HOME/jar/dummy-java-proj-0.0.1-SNAPSHOT.jar" &

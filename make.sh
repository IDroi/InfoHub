#!/bin/bash
#########################################################################
# File Name: make.sh
# Author: Carson Wang
# mail: carson.wang@droi.com
# Created Time: 2017-03-14 11:27:56
#########################################################################

OLD='1.2.17'
JAR_VERSION='1.2.18'
INFOHUB_DIR='com/idroi/infohub'
THIRD_DIR='com/idroi/third'

eval 'mkdir -p $INFOHUB_DIR/$JAR_VERSION'
eval 'mkdir -p $THIRD_DIR/$JAR_VERSION'

eval 'cp -r $INFOHUB_DIR/$OLD/* $INFOHUB_DIR/$JAR_VERSION'
eval 'cp -r $THIRD_DIR/$OLD/* $THIRD_DIR/$JAR_VERSION'

eval 'mv $INFOHUB_DIR/$JAR_VERSION/infohub-$OLD.pom $INFOHUB_DIR/$JAR_VERSION/infohub-$JAR_VERSION.pom'
eval 'mv $THIRD_DIR/$JAR_VERSION/third-$OLD.pom $THIRD_DIR/$JAR_VERSION/third-$JAR_VERSION.pom'

eval 'sed -ie "s/$OLD/$JAR_VERSION/g" $INFOHUB_DIR/$JAR_VERSION/infohub-$JAR_VERSION.pom'
eval 'sed -ie "s/$OLD/$JAR_VERSION/g" $THIRD_DIR/$JAR_VERSION/third-$JAR_VERSION.pom'

eval 'rm $INFOHUB_DIR/$JAR_VERSION/infohub-$JAR_VERSION.pome'
eval 'rm $THIRD_DIR/$JAR_VERSION/third-$JAR_VERSION.pome'

eval 'cp infohub-release.aar $INFOHUB_DIR/$JAR_VERSION/infohub-$JAR_VERSION.aar'
eval 'cp ThirdAPI.jar $THIRD_DIR/$JAR_VERSION/third-$JAR_VERSION.jar'


eval 'sed "/<version>$OLD<\/version>/a <version>$JAR_VERSION<\/version>" $INFOHUB_DIR/maven-metadata.xml'
eval 'sed "/<version>$OLD<\/version>/a <version>$JAR_VERSION<\/version>" $THIRD_DIR/maven-metadata.xml'


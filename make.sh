#!/bin/bash
#########################################################################
# File Name: make.sh
# Author: Carson Wang
# mail: carson.wang@droi.com
# Created Time: 2017-03-14 11:27:56
#########################################################################

OLD='1.2.17'
VERSION='1.2.18'
INFOHUB_DIR='com/idroi/infohub'
THIRD_DIR='com/idroi/third'

eval 'mkdir -p $INFOHUB_DIR/$VERSION'
eval 'mkdir -p $THIRD_DIR/$VERSION'

eval 'cp -r $INFOHUB_DIR/$OLD/* $INFOHUB_DIR/$VERSION'
eval 'cp -r $THIRD_DIR/$OLD/* $THIRD_DIR/$VERSION'

eval 'mv $INFOHUB_DIR/$VERSION/infohub-$OLD.pom $INFOHUB_DIR/$VERSION/infohub-$VERSION.pom'
eval 'mv $THIRD_DIR/$VERSION/third-$OLD.pom $THIRD_DIR/$VERSION/third-$VERSION.pom'

eval 'sed -i "s/$OLD/$VERSION/g" $INFOHUB_DIR/$VERSION/infohub-$VERSION.pom'
eval 'sed -i "s/$OLD/$VERSION/g" $THIRD_DIR/$VERSION/third-$VERSION.pom'

eval 'rm $INFOHUB_DIR/$VERSION/infohub-$OLD.aar'
eval 'rm $THIRD_DIR/$VERSION/third-$OLD.jar'
#eval 'rm $INFOHUB_DIR/$VERSION/infohub-$VERSION.pome'
#eval 'rm $THIRD_DIR/$VERSION/third-$VERSION.pome'

eval 'cp infohub-release.aar $INFOHUB_DIR/$VERSION/infohub-$VERSION.aar'
eval 'cp ThirdAPI.jar $THIRD_DIR/$VERSION/third-$VERSION.jar'


INFOHUB_META='com/idroi/infohub/maven-metadata.xml'
THIRD_META='com/idroi/third/maven-metadata.xml'

eval 'sed -i "/<release>/c\ \ \ \ <release>$VERSION<\/release>" $INFOHUB_META'
eval 'sed -i "/<release>/c\ \ \ \ <release>$VERSION<\/release>" $THIRD_META'

eval 'sed -i "/<version>$OLD<\/version>/a \ \ \ \ \ \ <version>$VERSION<\/version>" $INFOHUB_META'
eval 'sed -i "/<version>$OLD<\/version>/a \ \ \ \ \ \ <version>$VERSION<\/version>" $THIRD_META'

NOW=$(date +'%Y%m%d%H%M%S')
eval 'sed -i "/<lastUpdated>/c\ \ \ \ <lastUpdated>$NOW<\/lastUpdated>" $INFOHUB_META'
eval 'sed -i "/<lastUpdated>/c\ \ \ \ <lastUpdated>$NOW<\/lastUpdated>" $THIRD_META'

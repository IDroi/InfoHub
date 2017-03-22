#!/bin/bash
#########################################################################
# File Name: make.sh
# Author: Carson Wang
# mail: carson.wang@droi.com
# Created Time: 2017-03-14 11:27:56
#########################################################################

OLD='1.2.18'
VERSION='1.2.21'
INFOHUB_DIR='com/idroi/infohub'

eval 'mkdir -p $INFOHUB_DIR/$VERSION'

eval 'cp -r $INFOHUB_DIR/$OLD/* $INFOHUB_DIR/$VERSION'

eval 'mv $INFOHUB_DIR/$VERSION/infohub-$OLD.pom $INFOHUB_DIR/$VERSION/infohub-$VERSION.pom'

eval 'sed -i "s/$OLD/$VERSION/g" $INFOHUB_DIR/$VERSION/infohub-$VERSION.pom'

eval 'rm $INFOHUB_DIR/$VERSION/infohub-$OLD.aar'
#eval 'rm $INFOHUB_DIR/$VERSION/infohub-$VERSION.pome'

eval 'cp infohub-release.aar $INFOHUB_DIR/$VERSION/infohub-$VERSION.aar'

INFOHUB_META='com/idroi/infohub/maven-metadata.xml'

eval 'sed -i "/<release>/c\ \ \ \ <release>$VERSION<\/release>" $INFOHUB_META'

eval 'sed -i "/<version>$OLD<\/version>/a \ \ \ \ \ \ <version>$VERSION<\/version>" $INFOHUB_META'

NOW=$(date +'%Y%m%d%H%M%S')
eval 'sed -i "/<lastUpdated>/c\ \ \ \ <lastUpdated>$NOW<\/lastUpdated>" $INFOHUB_META'

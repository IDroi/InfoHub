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
MOPUB_DIR='com/idroi/mopub'

eval 'mkdir -p $INFOHUB_DIR/$VERSION'
eval 'mkdir -p $MOPUB_DIR/$VERSION'

eval 'cp -r $INFOHUB_DIR/$OLD/* $INFOHUB_DIR/$VERSION'
eval 'cp -r $MOPUB_DIR/$OLD/* $MOPUB_DIR/$VERSION'

eval 'mv $INFOHUB_DIR/$VERSION/infohub-$OLD.pom $INFOHUB_DIR/$VERSION/infohub-$VERSION.pom'
eval 'mv $MOPUB_DIR/$VERSION/mopub-$OLD.pom $MOPUB_DIR/$VERSION/mopub-$VERSION.pom'

eval 'sed -i "s/$OLD/$VERSION/g" $INFOHUB_DIR/$VERSION/infohub-$VERSION.pom'
eval 'sed -i "s/$OLD/$VERSION/g" $MOPUB_DIR/$VERSION/mopub-$VERSION.pom'

eval 'rm $INFOHUB_DIR/$VERSION/infohub-$OLD.aar'
eval 'rm $MOPUB_DIR/$VERSION/mopub-$OLD.jar'
#eval 'rm $INFOHUB_DIR/$VERSION/infohub-$VERSION.pome'
#eval 'rm $MOPUB_DIR/$VERSION/mopub-$VERSION.pome'

eval 'cp infohub-release.aar $INFOHUB_DIR/$VERSION/infohub-$VERSION.aar'
eval 'cp mopub-sdk-4.11.0.jar $MOPUB_DIR/$VERSION/mopub-$VERSION.jar'


INFOHUB_META='com/idroi/infohub/maven-metadata.xml'
MOPUB_META='com/idroi/mopub/maven-metadata.xml'

eval 'sed -i "/<release>/c\ \ \ \ <release>$VERSION<\/release>" $INFOHUB_META'
eval 'sed -i "/<release>/c\ \ \ \ <release>$VERSION<\/release>" $MOPUB_META'

eval 'sed -i "/<version>$OLD<\/version>/a \ \ \ \ \ \ <version>$VERSION<\/version>" $INFOHUB_META'
eval 'sed -i "/<version>$OLD<\/version>/a \ \ \ \ \ \ <version>$VERSION<\/version>" $MOPUB_META'

NOW=$(date +'%Y%m%d%H%M%S')
eval 'sed -i "/<lastUpdated>/c\ \ \ \ <lastUpdated>$NOW<\/lastUpdated>" $INFOHUB_META'
eval 'sed -i "/<lastUpdated>/c\ \ \ \ <lastUpdated>$NOW<\/lastUpdated>" $MOPUB_META'

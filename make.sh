#!/bin/bash
#########################################################################
# File Name: make.sh
# Author: Carson Wang
# mail: carson.wang@droi.com
# Created Time: 2017-03-14 11:27:56
#########################################################################

project_name='infohub'

old='1.2.21'
version='1.2.22'
dir='com/idroi/infohub'

#-- create directory for new version
eval 'mkdir -p $dir/$version'
eval 'cp -r $dir/$old/* $dir/$version'
eval 'mv $dir/$version/$project_name-$old.pom $dir/$version/$project_name-$version.pom'


#-- revise aar and pom
eval 'sed -i "s/$old/$version/g" $dir/$version/$project_name-$version.pom'
eval 'rm $dir/$version/$project_name-$old.aar'
eval 'cp $project_name-release.aar $dir/$version/$project_name-$version.aar'


#-- change directory to revise maven-metadata and last updated
cd $dir
eval 'sed -i "/<release>/c\ \ \ \ <release>$version<\/release>" maven-metadata.xml'
eval 'sed -i "/<version>$old<\/version>/a \ \ \ \ \ \ <version>$version<\/version>" maven-metadata.xml'

NOW=$(date +'%Y%m%d%H%M%S')
eval 'sed -i "/<lastUpdated>/c\ \ \ \ <lastUpdated>$NOW<\/lastUpdated>" maven-metadata.xml'

cd -

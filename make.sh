#!/bin/bash
#########################################################################
# File Name: make.sh
# Author: Carson Wang
# mail: carson.wang@droi.com
# Created Time: 2017-03-14 11:27:56
#########################################################################

project_name='infohub'

old='1.2.22'
new='1.2.23'
dir='com/idroi/infohub'

old_dir="$dir/$old"
new_dir="$dir/$new"

#-- create directory for new version
mkdir -p $new_dir
cp -r $old_dir/* $new_dir
mv $new_dir/$project_name-$old.pom $new_dir/$project_name-$new.pom


#-- revise aar and pom
sed -i "s/$old/$new/g" $new_dir/$project_name-$new.pom
rm $new_dir/$project_name-$old.aar
cp $project_name-release.aar $new_dir/$project_name-$new.aar


#-- change directory to revise maven-metadata and last updated
cd $dir
meta='maven-metadata.xml'

sed -i "/<release>/c\ \ \ \ <release>$new<\/release>" $meta
sed -i "/<version>$old<\/version>/a \ \ \ \ \ \ <version>$new<\/version>" $meta

now=$(date +'%Y%m%d%H%M%S')
sed -i "/<lastUpdated>/c\ \ \ \ <lastUpdated>$now<\/lastUpdated>" $meta

cd -

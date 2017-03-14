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

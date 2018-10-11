#!/bin/bash
# This will create a web server app and upload everything from the source
# directory to that web server
# $1 is the application name, $2 is the course directory
APPNAME=$1
oc new-project ${APPNAME}
oc new-build httpd:latest --binary=true --name ${APPNAME} -n ${APPNAME}
oc start-build bc/${APPNAME} --from-dir=$2 -n ${APPNAME} --wait=true
oc new-app ${APPNAME} -n ${APPNAME}
oc expose svc ${APPNAME} -n ${APPNAME}
oc get route ${APPNAME} -n ${APPNAME}

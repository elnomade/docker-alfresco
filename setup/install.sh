#!/bin/bash
set -e
# Moved installation in Dockerfile
mv /opt/setup/apply_amps_unatended.sh /opt/alfresco/bin
mv /opt/setup/alfrescotrashcancleaner2.amp /opt/alfresco/amps
mv /opt/setup/protectnodes.amp /opt/alfresco/amps
/opt/alfresco/bin/apply_amps_unatended.sh
mv /opt/setup/custom-surf-application-context.xml /opt/alfresco/tomcat/shared/classes/alfresco/web-extension

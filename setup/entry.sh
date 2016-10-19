#!/bin/bash
# trap SIGTERM and gracefully stops alfresco
trap '/opt/alfresco/alfresco.sh stop;exit 0' SIGTERM
set -e
if [ ! -f /opt/alfresco/alf_data/foo.txt ]; then
    cp -Rp /opt/alfresco/alf_data_back/* /opt/alfresco/alf_data;
    bash /opt/setup/install.sh;
    /opt/setup/tunerepo.sh;
    /opt/setup/modifinitpass.sh;
    /opt/alfresco/alfresco.sh start;
    /opt/setup/waitready.sh;
    /opt/alfresco/alfresco.sh stop;
    /opt/setup/tunesolr.sh;
    touch /opt/alfresco/alf_data/foo.txt
fi

# setting values for all the "-e ALF_xxx=..." parameters provided at startup
bash /opt/setup/tuneglobal.sh

# starts alfresco
/opt/alfresco/alfresco.sh start;

# loop so container does not exit
while true;do sleep 5;done

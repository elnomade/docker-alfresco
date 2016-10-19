FROM ubuntu:trusty
MAINTAINER Leonardo Luduena 
ENV DEBIAN_FRONTEND noninteractive

ADD setup /opt/setup
WORKDIR /opt/setup

RUN   apt-get update \
   && apt-get install -y --no-install-recommends ubuntu-desktop \
   && apt-get update \
   && apt-get install -y wget curl \
   && chmod +x *.bin \
   && chmod +x passencode.py \
   && chmod +x modifinitpass.sh \
   && chmod +x tunesolr.sh \
   && chmod +x tunerepo.sh \
   && chmod +x waitready.sh \
   && chmod +x entry.sh \
   && chmod +x tuneglobal.sh \
   && chmod +x apply_amps_unatended.sh \
   && ./alfresco-community-installer-201606-EA-linux-x64.bin --mode unattended --alfresco_admin_password admin --prefix /opt/alfresco \
   && rm ./alfresco-community-installer-201606-EA-linux-x64.bin \
   && mv /opt/alfresco/alf_data /opt/alfresco/alf_data_back \
   && mkdir /opt/alfresco/alf_data



CMD ["entry.sh"]



FROM ajeeth/otrs-itsm_auto:latest
MAINTAINER miodrag.seslija@consulteer.ch

COPY datadump/DatabaseBackup.sql /opt

COPY load.sh /opt

RUN echo '/opt/load.sh' >> /firstrun.sh


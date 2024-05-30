FROM registry.fedoraproject.org/fedora:39

## NOTE: tiff2pdf is no longer in Fedora 40 tiff tool, hence run with 39
## ULD required from: https://negativo17.org/samsung-unified-linux-driver-printers-scanners/

LABEL maintainer="Markus Koch <nomail>" 

RUN curl -o /etc/yum.repos.d/fedora-uld.repo https://negativo17.org/repos/fedora-uld.repo &&\
    rpm --import https://negativo17.org/repos/RPM-GPG-KEY-slaanesh && \
    dnf update -y && \
    dnf install -y less net-tools netpbm-progs libtiff-tools langpacks-en langpacks-de \
      which util-linux sudo iputils binutils net-snmp file unzip perl-Sane uld &&\
    ln -s /mnt/Users /Users &&\
    useradd -r -c "Markus Koch (fedora)" -d /Users/mkoch -g wheel  -M -N -u 501 mkoch &&\
    yum clean all

ENV LANG=de_DE.UTF-8
ENV LC_MESSAGES=C

WORKDIR /Users/mkoch
USER mkoch

ENTRYPOINT /bin/bash

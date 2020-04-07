FROM centos:centos7

# Install Epel
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

# Install base tools
RUN yum -y install --setopt=tsflags=nodocs git \
    openssh-clients \
    which \
    wget \
    && yum clean all \
    && rm -rf /var/cache/yum

CMD ["/bin/bash"]

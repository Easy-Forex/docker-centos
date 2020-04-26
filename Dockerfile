FROM centos:centos7

# Install Epel
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

# Enable Networking
RUN echo "NETWORKING=yes" > /etc/sysconfig/network

# Install base tools
RUN yum -y install --setopt=tsflags=nodocs git \
    openssh-clients \
    which \
    wget \
    tree \
    && yum clean all \
    && rm -rf /var/cache/yum

# Configure SSH for github hosts to be known
RUN mkdir ~/.ssh \
    && echo > ~/.ssh/known_hosts \
    && ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts \
    && chmod -R u+rwX,go-rwX ~/.ssh

CMD ["/bin/bash"]

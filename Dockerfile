FROM amazonlinux:2

ENV NVM_VERSION=0.35.3
ENV NODE_VERSION=12.13.0

# Install Curl, Git, OpenSSL (AWS Amplify requirements) and tar
RUN touch ~/.bashrc
RUN yum -y update && \
    yum -y install \
    curl \
    git \
    openssl \
    tar \
    yum clean all && \
    rm -rf /var/cache/yum

# Install Node (AWS Amplify requirement)
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v${NVM_VERSION}/install.sh | bash

# Configure environment
RUN source ~/.bashrc && \
    npm install -g yarn

ENTRYPOINT [ "bash", "-c" ]

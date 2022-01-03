FROM amazonlinux:2


# Install dev and build packages
RUN yum -y update && \
    yum -y install \
    autoconf-archive \
    automake \
    libtool \
    libpng \
    libpng-devel \
    nasm \
    shadow-utils \
    patch \
    make \
    gcc \
    gcc-c++ \
    curl \
    git \
    openssl \
    tar \
    xz \
    yum clean all && \
    rm -rf /var/cache/yum

RUN curl -fsSL https://rpm.nodesource.com/setup_14.x | bash - \
      && yum upgrade -y \
      && yum install -y nodejs \
      && yum clean all && \
      rm -rf /var/cache/yum

RUN curl -sL https://dl.yarnpkg.com/rpm/yarn.repo | tee /etc/yum.repos.d/yarn.repo \
      && yum install -y yarn \
      && yum clean all \
      && rm -rf /var/cache/yum

# Install Node and Yarn
RUN groupadd --gid 1000 node \
  && useradd --uid 1000 --gid node --shell /bin/bash --create-home node

ARG AMPLIFY_VERSION ^4.46
RUN npm install -g @aws-amplify/cli@$AMPLIFY_VERSION --verbose --unsafe-perm=true

# Install latest AWS CLI
RUN yum install -y unzip \
        && yum clean all \
        && rm -rf /var/cache/yum \
        && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
        && unzip awscliv2.zip \
        && ./aws/install \
        && rm -rf awscliv2.zip aws

ENTRYPOINT [ "bash", "-c" ]

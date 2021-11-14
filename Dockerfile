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

ENV AMPLIFY_VERSION ^4.41.2
RUN npm install -g @aws-amplify/cli@$AMPLIFY_VERSION --verbose --unsafe-perm=true


ENTRYPOINT [ "bash", "-c" ]

FROM centos:7.7.1908 as build

ARG KOTLIN_VERSION

RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7 && \
    yum -y updateinfo && \
    yum install -y wget unzip

RUN wget https://github.com/JetBrains/kotlin/releases/download/v${KOTLIN_VERSION}/kotlin-compiler-${KOTLIN_VERSION}.zip
RUN unzip kotlin-compiler-${KOTLIN_VERSION}.zip -d /

FROM centos:7.7.1908

COPY --from=build /kotlinc /kotlinc

RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7 && \
    yum -y updateinfo && \
    yum install -y java-11-openjdk-headless

ENV JAVA_HOME "/usr/lib/jvm/jre-11"

# Working folder
VOLUME /context
WORKDIR /context

ENTRYPOINT ["/kotlinc/bin/kotlin"]

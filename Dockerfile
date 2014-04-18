FROM base
MAINTAINER ifoo "http://nopage"
RUN echo "deb http://archive.ubuntu.com/ubuntu trusty main universe multiverse" > /etc/apt/sources.list
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y openjdk-7-jre wget
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
RUN (cd /tmp && wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.1.1.tar.gz -O pkg.tar.gz && tar zxf pkg.tar.gz && mv elasticsearch-* /opt/elasticsearch)
RUN rm -rf /tmp/*

EXPOSE 9200
EXPOSE 9300
ENTRYPOINT ["/opt/elasticsearch/bin/elasticsearch"]
CMD ["-f"]

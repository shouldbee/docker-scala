FROM phusion/baseimage

ENV HOME /root

RUN echo 'LANG="en_US.UTF-8"' > /etc/default/locale
RUN echo 'LANGUAGE="en_US:en"' >> /etc/default/locale
RUN locale-gen en_US.UTF-8
RUN update-locale en_US.UTF-8

# Install Java.
RUN \
	echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
	echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections && \
	sudo apt-get update && \
	sudo apt-get install -y software-properties-common && \
	sudo add-apt-repository ppa:webupd8team/java && \
	sudo apt-get update && \
	sudo apt-get install -y oracle-java7-installer libjansi-java

# Install Scala.
RUN apt-get install -y wget && \
    wget http://www.scala-lang.org/files/archive/scala-2.10.4.deb && \
    dpkg -i scala-2.10.4.deb && \
    rm -f scala-2.10.4

# for run
CMD ["/sbin/my_init"]

# cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

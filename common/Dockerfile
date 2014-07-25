FROM phusion/baseimage

ENV HOME /root

# set locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Install Java 1.7
RUN \
	echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
	echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections && \
	sudo apt-get update -qq && \
	sudo apt-get install -y software-properties-common -qq && \
	sudo add-apt-repository ppa:webupd8team/java && \
	sudo apt-get update -qq && \
	sudo apt-get install -y oracle-java7-installer libjansi-java -qq

# for run
CMD ["/sbin/my_init"]

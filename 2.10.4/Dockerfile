FROM common

# Install Scala.
RUN apt-get install -y wget && \
    wget -q http://www.scala-lang.org/files/archive/scala-2.10.4.deb && \
    dpkg -i scala-2.10.4.deb && \
    rm -f scala-2.10.4.deb

# cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

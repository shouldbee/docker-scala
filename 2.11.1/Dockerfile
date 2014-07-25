FROM common

# Install Scala.
RUN apt-get install -y wget && \
    wget -q http://www.scala-lang.org/files/archive/scala-2.11.1.deb && \
    dpkg -i scala-2.11.1.deb && \
    rm -f scala-2.11.1.deb

# cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

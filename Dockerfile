FROM python:3.9-slim-buster
RUN apt-get update && apt-get -y --no-install-recommends install gpg  wget curl ca-certificates zip bzip2
COPY requirements.txt /requirements.txt
RUN set -ex && pip install -r /requirements.txt
RUN wget https://github.com/cdr/code-server/releases/download/v3.12.0/code-server-3.12.0-linux-amd64.tar.gz \
    && tar -xzvf code-server-3.12.0-linux-amd64.tar.gz && chmod +x code-server-3.12.0-linux-amd64/code-server
RUN rm code-server-3.12.0-linux-amd64.tar.gz
RUN wget -q https://downloads.apache.org/spark//spark-3.1.2/spark-3.1.2-bin-hadoop3.2.tgz
RUN tar xf spark-3.1.2-bin-hadoop3.2.tgz
RUN rm -f spark-3.1.2-bin-hadoop3.2.tgz
ENV SPARK_HOME /spark-3.1.2-bin-hadoop3.2
RUN mkdir -p /usr/share/man/man1 /usr/share/man/man2
RUN apt-get update && apt-get -y --no-install-recommends install unzip
RUN curl -s "https://get.sdkman.io" | bash
RUN bash -c "source $HOME/.sdkman/bin/sdkman-init.sh && \
    yes | sdk install java 8.0.275.hs-adpt && \    
    rm -rf $HOME/.sdkman/archives/* && \
    rm -rf $HOME/.sdkman/tmp/*"
RUN ls -ld $HOME/.sdkman/candidates/java/8.0.275.hs-adpt
RUN mv $HOME/.sdkman/candidates/java/8.0.275.hs-adpt /opt/8.0.275.hs-adpt
RUN ln -s /opt/8.0.275.hs-adpt/bin/java /usr/bin/java
RUN java -version
COPY docker-entrypoint.sh /usr/local/bin/
ENV PATH="code-server-3.12.0-linux-amd64/bin/:${PATH}"
ENTRYPOINT ["docker-entrypoint.sh"]
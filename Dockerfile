FROM openjdk:17-jdk-buster

ARG JMETER_VERSION="5.3"

ENV JMETER_HOME /opt/apache-jmeter-${JMETER_VERSION}
ENV	JMETER_BIN	${JMETER_HOME}/bin
ENV PATH $PATH:$JMETER_BIN

COPY --from=justb4/jmeter:5.3 /opt/ /opt/
COPY --from=justb4/jmeter:5.3 /entrypoint.sh /entrypoint.sh

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
	unzip awscliv2.zip && \
	./aws/install

WORKDIR	${JMETER_HOME}

ENTRYPOINT ["/entrypoint.sh"]
FROM maven:3.6.1-jdk-11

COPY nexus-cnpq.pem /usr/local/openjdk-11/lib/security/nexus.pem

# Node related
# ------------
RUN echo "# Installing Nodejs" && \
    curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get install nodejs build-essential -y && \
    npm set strict-ssl false && \
    npm i -g npm@latest && \
    npm i -g bower yarn && \
    npm cache clear -f && \
    npm i -g n && \
    n stable && \
    keytool -importcert -file /usr/local/openjdk-11/lib/security/nexus.pem -alias nexus -storepass changeit -keystore /usr/local/openjdk-11/lib/security/cacerts

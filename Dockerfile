FROM maven:3.6.1-jdk-11

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
    n stable


FROM maven:3.6.2-jdk-11

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

# 
# Baixando e instalando Google Chrome
# Utilizado nos testes de integração para o frontend
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    dpkg -i google-chrome-stable_current_amd64.deb; apt-get -fy install
ENV CHROME_BIN /usr/bin/google-chrome

# 
# Copia do package.json para realizar o download das 
# dependencias no momento da geração da imagem maven
#
WORKDIR /opt/cnpq/dependecias
COPY package.json .

RUN npm install

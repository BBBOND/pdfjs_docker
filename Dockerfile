FROM node:lts-alpine
RUN mkdir -p /opt/node
WORKDIR /tmp/
RUN wget https://github.com/mozilla/pdf.js/releases/download/v2.10.377/pdfjs-2.10.377-dist.zip -O pdfjs-dist.zip
RUN unzip pdfjs-dist.zip -d /opt/node/
RUN npm i -g serve
WORKDIR /opt/node
COPY ./index.html /opt/node
EXPOSE 8080
CMD ["serve", "-d", "/opt/node", "-p", "8080"]
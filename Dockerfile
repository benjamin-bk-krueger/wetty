FROM ubuntu

LABEL version="0.1"
LABEL maintaner="Ben Krueger <sayhello@blk.pm>"
#LABEL release-date="2020-04-05"
#LABEL promoted="true"

RUN apt-get update
RUN apt-get install -y libncurses-dev flex libssl-dev libelf-dev bc bison git curl
RUN DEBIAN_FRONTEND=noninteractive  apt-get install -y npm

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs
RUN npm install --global yarn
RUN yarn global add wetty

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

EXPOSE 3000

CMD ["wetty","-p","3000"]  

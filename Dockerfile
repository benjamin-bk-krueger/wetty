FROM ubuntu:20.04

LABEL version="0.9"
LABEL maintaner="Ben Krueger <sayhello@blk8.de>"

RUN apt-get update
RUN apt-get install -y libncurses-dev flex libssl-dev libelf-dev bc bison git curl sshpass
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y npm

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs
RUN npm install --global yarn
RUN yarn global add wetty@2.3.0

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

RUN echo "LogLevel=ERROR" >> /etc/ssh/ssh_config

RUN useradd -m -s /bin/false wetty

EXPOSE 3000

USER wetty

RUN mkdir /home/wetty/.ssh

CMD ["wetty","-p","3000"]

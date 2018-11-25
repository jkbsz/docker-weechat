FROM ubuntu:18.10

MAINTAINER Jakub Szczygłowski <jszczyglowski@gmail.com>

# Apt
RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y apt-transport-https gnupg ca-certificates openssh-server screen less
RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 11E9DE8848F2B65222AA75B8D1820DB22A11534E

COPY weechat.list /etc/apt/sources.list.d/

RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y weechat-curses weechat-plugins weechat-python weechat-perl \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*


COPY authorized_keys /root/.ssh/
RUN chmod 600 /root/.ssh/authorized_keys && chmod 700 /root/.ssh

COPY weechat-entrypoint.sh /root/
RUN chmod 700 /root/weechat-entrypoint.sh

RUN mkdir -p /var/run/sshd

EXPOSE 22

ENTRYPOINT ["/root/weechat-entrypoint.sh"]


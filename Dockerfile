#
# Redis Dockerfile
#
# https://github.com/dockerfile/redis
#

# Pull base image.
FROM ubuntu

RUN apt-get update && apt-get -y install wget build-essential vim

# Install Redis.
RUN \
  cd /tmp && \
  wget http://download.redis.io/redis-stable.tar.gz && \
  tar xvzf redis-stable.tar.gz && \
  cd redis-stable && \
  make && \
  make install && \
  cp -f src/redis-sentinel /usr/local/bin && \
  mkdir -p /etc/redis && \
  cp -f *.conf /etc/redis && \
  rm -rf /tmp/redis-stable* && \
  sed -i 's/^\(bind .*\)$/# \1/' /etc/redis/redis.conf && \
  sed -i 's/^\(daemonize .*\)$/# \1/' /etc/redis/redis.conf && \
  sed -i 's/^\(dir .*\)$/# \1\ndir \/data/' /etc/redis/redis.conf && \
  sed -i 's/^\(logfile .*\)$/# \1/' /etc/redis/redis.conf

# Define mountable directories.
VOLUME ["/data"]

RUN apt-get update && apt-get -y install cron

# Add script file in the container
COPY insertData.sh /etc/insertData.sh

# Give execution rights on the cron job
RUN chmod 755 /etc/insertData.sh

# Define working directory.
WORKDIR /data


# Define default command.
CMD redis-server /etc/redis/redis.conf & sh /etc/insertData.sh

# Expose ports.
EXPOSE 6379

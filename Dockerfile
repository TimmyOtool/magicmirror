FROM karsten13/magicmirror:latest

USER root

RUN set -e; \
    apt-get update; \
    DEBIAN_FRONTEND=noninteractive apt-get -qy --no-install-recommends install python3 g++ make; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*; \
    groupadd --gid 997 gpio; \
    usermod -a -G gpio node;

USER node

RUN npm install del request

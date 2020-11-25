FROM debian:buster-slim

ARG GH_VERSION

RUN apt-get update && apt-get install -y curl
RUN ARCHITECTURE=$(dpkg --print-architecture); \
    curl -sL -o gh.deb https://github.com/cli/cli/releases/download/v${GH_VERSION}/gh_${GH_VERSION}_linux_${ARCHITECTURE}.deb

RUN apt install -y ./gh.deb
RUN rm -rf gh.deb
FROM ghcr.io/ltla/emcmake-docker/builder:2023-07-17

RUN git clone https://github.com/kanaverse/scran.js && \
    cd scran.js && \
    git checkout update

WORKDIR scran.js

# Putting Node and npm in the path.
ENV FINALPATH="${PATH}"
ENV PATH="/emsdk/node/16.20.0_64bit/bin:${FINALPATH}"

# Grabbing the node modules... but also reverting any NPM-induced changes to these files.
RUN npm i --include=dev && \
    git checkout -- package.json

# Running the builds.
RUN ./build.sh main
RUN ./build.sh browser

# Removing Node from the path.
ENV PATH="${FINALPATH}"

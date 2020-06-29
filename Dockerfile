FROM clojure:tools-deps-alpine AS clojure-deps

FROM jupyter/minimal-notebook:latest as jupyter

LABEL maintainer "rinx <rintaro.okamura@gmail.com>"

USER root

RUN apt-get update \
    && apt-get install -y \
    openjdk-8-jdk \
    rlwrap \
    && rm -rf /var/lib/apt/lists/*

COPY --from=clojure-deps /usr/local/bin/clojure /usr/local/bin/clojure
COPY --from=clojure-deps /usr/local/bin/clj     /usr/local/bin/clj
COPY --from=clojure-deps /usr/local/lib/clojure /usr/local/lib/clojure

USER $NB_UID

RUN mkdir -p $HOME/clojupyter
WORKDIR $HOME/clojupyter

COPY deps.edn deps.edn

RUN clojure -A:depstar -m hf.depstar.uberjar clojupyter-standalone.jar \
    && clj -m clojupyter.cmdline install --ident vald-client --jarfile clojupyter-standalone.jar \
    && clj -m clojupyter.cmdline list-installs

WORKDIR $HOME

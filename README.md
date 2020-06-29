clojupyter-vald-sample
===
[![Docker Pulls](https://img.shields.io/docker/pulls/rinx/clojupyter-vald-sample.svg?style=flat-square)](https://hub.docker.com/r/rinx/clojupyter-vald-sample)

Use [vald-client-clj](https://github.com/vdaas/vald-client-clj) from Jupyter Notebook.
Powered by [Clojupyter](https://github.com/clojupyter/clojupyter).

Run Jupyter Notebook
---

    $ docker run -p 8888:8888 -it rinx/clojupyter-vald-sample

Notebook app will be started in the container.

Create a new notebook by selecting "Clojure (vald-client)" kernel.

<img src="./screenshot01.png" width="100%"/>

Now you can access to your Vald cluster by using vald-client-clj APIs.

<img src="./screenshot02.png" width="100%"/>

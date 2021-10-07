FROM        bash

ARG         version=
ENV         VERSION=$version

RUN         test -n "$version" || (echo 'build-arg required: "version"' && false) && \
            mkdir -p /bundletool

ADD         https://github.com/google/bundletool/releases/download/$version/bundletool-all-$version.jar /bundletool/bundletool.jar


ENTRYPOINT  ["cp", "/bundletool/bundletool.jar"]
CMD         ["bundletool.jar"]

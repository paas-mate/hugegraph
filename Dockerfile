FROM ttbb/compile:jdk17-git-mvn AS compiler

RUN git clone --depth 1 https://github.com/apache/incubator-hugegraph.git && \
cd incubator-hugegraph && \
mvn -B clean package -DskipTests && \
echo "end"

FROM ttbb/base:jdk17

ENV HUGEGRAPH_HOME /opt/sh/hugegraph

COPY --from=compiler /opt/sh/incubator-hugegraph/hugegraph-0.13.0 /opt/sh/hugegraph

WORKDIR /opt/sh/hugegraph

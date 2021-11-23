FROM elasticsearch:7.4.0

RUN yes | ./bin/elasticsearch-plugin install https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v7.4.0/elasticsearch-analysis-ik-7.4.0.zip

ENV discovery.type=single-node

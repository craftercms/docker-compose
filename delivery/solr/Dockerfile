FROM solr:7.7.2

USER root

RUN usermod -u 1000 solr; \
    groupmod -g 1000 solr; \
    chown -R "solr:solr" /opt/solr /docker-entrypoint-initdb.d /opt/docker-solr /opt/mysolrhome;

USER solr
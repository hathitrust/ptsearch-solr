FROM solr:10.0.0
LABEL org.opencontainers.image.source https://github.com/hathitrust/ptsearch-solr

COPY --chown=solr:solr . /var/solr/data/ptsearch


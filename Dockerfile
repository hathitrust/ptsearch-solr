FROM solr:8.11.2
LABEL org.opencontainers.image.source https://github.com/hathitrust/ptsearch-solr

COPY --chown=solr:solr . /var/solr/data/ptsearch

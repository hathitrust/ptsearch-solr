FROM solr:8

COPY --chown=solr:solr . /var/solr/data/ptsearch

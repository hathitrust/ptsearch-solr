# Page Turner search-in-a-page solr configuration

Pretty straightforward solr configuration used for ptsearch.

See branch solr-tomcat for the pre-solr8 configuration.

## Always use wt=xml

The cilent code expects XML responses; thus in the solr8 branch the search handler needs to have
that set as a default, since more modern solrs default to json.

## Highlighting

The pt code expect `hl.tag.pre` and `hl.tag.post` to use
`{lt:}` and `{gt:}` instead of `&lt;` and `&gt;`, as see in the solrconfig.xml file.

## Running the solr container

### Build and run
```docker compose up --build -d```

### Ping the core
```docker compose run test```

### Confirm schema loaded with expected fields
curl 'http://localhost:8983/solr/ptsearch/admin/luke?wt=json&show=schema' | jq '.schema.fields | keys'

### Index a document and verify highlighting still works

```
curl -X POST 'http://localhost:8983/solr/ptsearch/update?commit=true' \
  -H 'Content-Type: application/json' \
  -d '[{"id":"test.001","vol_id":"test","seq":1,"ocr":"hello world","title":["Test Title"],"rights":0}]'
```

### Check if the highlights are specific in ocr field

```
curl 'http://localhost:8983/solr/ptsearch/select?q=hello&hl=true&hl.fl=ocr'
```

The output should be something like this, where the `ocr` field contains the highlighted text with the expected tags:
```
<lst name="highlighting">
  <lst name="test.001">
    <arr name="ocr">
      <str>{lt:}strong class="solr_highlight_1"{gt:}hello{lt:}/strong{gt:}; world</str>
    </arr>
  </lst>
</lst>

```


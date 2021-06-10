# Page Turner search-in-a-page solr configuration

Pretty straightforward solr configuration used for ptsearch.

## Always use wt=xml

The cilent code expects XML responses; thus in the solr8 branch the search handler needs to have
that set as a default, since more modern solrs default to json.

## Highlighting

The pt code expect `hl.tag.pre` and `hl.tag.post` to use
`{lt:}` and `{gt:}` instead of `&lt;` and `&gt;`, as see in the solrconfig.xml file.

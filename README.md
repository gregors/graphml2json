# Graphml2json

This utility takes graphml and converts it to json suitable for use in D3

## Installation

Add this line to your application's Gemfile:

    gem 'graphml2json'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install graphml2json

## Usage

### From ruby
```
>> require 'open-uri'
>> require 'graphml2json'

>> data = open('http://graphml.graphdrawing.org/primer/attributes.graphml').read
=> "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!-- This file was written by the JAVA GraphML Library.-->\n<graphml xmlns=\"http://graphml.graphdrawing.org/xmlns\"  xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\nxsi:schemaLocation=\"http://graphml.graphdrawing.org/xmlns http://graphml.graphdrawing.org/xmlns/1.0/graphml.xsd\">\n  <key id=\"d0\" for=\"node\" attr.name=\"color\" attr.type=\"string\">\n    <default>yellow</default>\n  </key>\n  <key id=\"d1\" for=\"edge\" attr.name=\"weight\" attr.type=\"double\"/>\n  <graph id=\"G\" edgedefault=\"undirected\">\n    <node id=\"n0\">\n      <data key=\"d0\">green</data>\n    </node>\n    <node id=\"n1\"/>\n    <node id=\"n2\">\n      <data key=\"d0\">blue</data>\n    </node>\n    <node id=\"n3\">\n      <data key=\"d0\">red</data>\n    </node>\n    <node id=\"n4\"/>\n    <node id=\"n5\">\n      <data key=\"d0\">turquoise</data>\n    </node>\n    <edge id=\"e0\" source=\"n0\" target=\"n2\">\n      <data key=\"d1\">1.0</data>\n    </edge>\n    <edge id=\"e1\" source=\"n0\" target=\"n1\">\n      <data key=\"d1\">1.0</data>\n    </edge>\n    <edge id=\"e2\" source=\"n1\" target=\"n3\">\n      <data key=\"d1\">2.0</data>\n    </edge>\n    <edge id=\"e3\" source=\"n3\" target=\"n2\"/>\n    <edge id=\"e4\" source=\"n2\" target=\"n4\"/>\n    <edge id=\"e5\" source=\"n3\" target=\"n5\"/>\n    <edge id=\"e6\" source=\"n5\" target=\"n4\">\n      <data key=\"d1\">1.1</data>\n    </edge>\n  </graph>\n</graphml>\n"

>> Graphml2Json.generate(data)

=> "{\"nodes\":[{\"name\":0,\"d0\":\"green\"},{\"name\":1},{\"name\":2,\"d0\":\"blue\"},{\"name\":3,\"d0\":\"red\"},{\"name\":4},{\"name\":5,\"d0\":\"turquoise\"}],\"edges\":[{\"source\":0,\"target\":2,\"d1\":\"1.0\"},{\"source\":0,\"target\":1,\"d1\":\"1.0\"},{\"source\":1,\"target\":3,\"d1\":\"2.0\"},{\"source\":3,\"target\":2},{\"source\":2,\"target\":4},{\"source\":3,\"target\":5},{\"source\":5,\"target\":4,\"d1\":\"1.1\"}]}"
```

### From a terminal 

You can also invoke the `graphml2json` utility from the command line. It takes stdin as input.

```
$ curl http://graphml.graphdrawing.org/primer/attributes.graphml | graphml2json | json_pp
{
   "nodes" : [
      {
         "d0" : "green",
         "name" : 0
      },
      {
         "name" : 1
      },
      {
         "name" : 2,
         "d0" : "blue"
      },
      {
         "name" : 3,
         "d0" : "red"
      },
      {
         "name" : 4
      },
      {
         "d0" : "turquoise",
         "name" : 5
      }
   ],
   "edges" : [
      {
         "d1" : "1.0",
         "source" : 0,
         "target" : 2
      },
      {
         "target" : 1,
         "d1" : "1.0",
         "source" : 0
      },
      {
         "source" : 1,
         "d1" : "2.0",
         "target" : 3
      },
      {
         "target" : 2,
         "source" : 3
      },
      {
         "source" : 2,
         "target" : 4
      },
      {
         "source" : 3,
         "target" : 5
      },
      {
         "d1" : "1.1",
         "source" : 5,
         "target" : 4
      }
   ]
}

```

### For Docker Dev

     docker build -t graphml_dev .

     # run tests
     docker run -it -rm graphml_dev

## Changelog

* [changelog](https://github.com/gregors/graphml2json/blob/master/CHANGELOG.md)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

# Graphml2json

Takes graphml and converts it to json for use in D3

## Installation

Add this line to your application's Gemfile:

    gem 'graphml2json'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install graphml2json

## Usage

```
gregors$ irb --simple-prompt
>> file = File.open('simple.graphml', 'rb')
=> #<File:simple.graphml>
>> graphml = file.read
=> "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<graphml xmlns=\"http://graphml.graphdrawing.org/xmlns\"  \n    xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n    xsi:schemaLocation=\"http://graphml.graphdrawing.org/xmlns\n     http://graphml.graphdrawing.org/xmlns/1.0/graphml.xsd\">\n  <graph id=\"G\" edgedefault=\"undirected\">\n    <node id=\"n0\"/>\n    <node id=\"n1\"/>\n    <node id=\"n2\"/>\n    <node id=\"n3\"/>\n    <node id=\"n4\"/>\n    <node id=\"n5\"/>\n    <node id=\"n6\"/>\n    <node id=\"n7\"/>\n    <node id=\"n8\"/>\n    <node id=\"n9\"/>\n    <node id=\"n10\"/>\n    <edge source=\"n0\" target=\"n2\"/>\n    <edge source=\"n1\" target=\"n2\"/>\n    <edge source=\"n2\" target=\"n3\"/>\n    <edge source=\"n3\" target=\"n5\"/>\n    <edge source=\"n3\" target=\"n4\"/>\n    <edge source=\"n4\" target=\"n6\"/>\n    <edge source=\"n6\" target=\"n5\"/>\n    <edge source=\"n5\" target=\"n7\"/>\n    <edge source=\"n6\" target=\"n8\"/>\n    <edge source=\"n8\" target=\"n7\"/>\n    <edge source=\"n8\" target=\"n9\"/>\n    <edge source=\"n8\" target=\"n10\"/>\n  </graph>\n</graphml>\n"
>> require 'graphml2json'
=> true
>> json = Graphml2Json.generate(graphml)
=> "{\"nodes\":[{\"name\":0},{\"name\":1},{\"name\":2},{\"name\":3},{\"name\":4},{\"name\":5},{\"name\":6},{\"name\":7},{\"name\":8},{\"name\":9},{\"name\":10}],\"edges\":[{\"source\":0,\"target\":2},{\"source\":1,\"target\":2},{\"source\":2,\"target\":3},{\"source\":3,\"target\":5},{\"source\":3,\"target\":4},{\"source\":4,\"target\":6},{\"source\":6,\"target\":5},{\"source\":5,\"target\":7},{\"source\":6,\"target\":8},{\"source\":8,\"target\":7},{\"source\":8,\"target\":9},{\"source\":8,\"target\":10}]}"
```

sample file used taken from:
http://graphml.graphdrawing.org/primer/graphml-primer.html

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

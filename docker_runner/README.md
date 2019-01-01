# Graphml2json Docker runner

This utility takes graphml and converts it to json suitable for use in D3


## Usage


### Usage From Docker 

    docker build -t graphml2json .
    
    # notice no t in docker run command
    curl http://graphml.graphdrawing.org/primer/attributes.graphml | docker run -i --rm graph2json

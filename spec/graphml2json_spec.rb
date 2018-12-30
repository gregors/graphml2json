require 'spec_helper'

describe Graphml2Json do
  let(:json) {'{"nodes":[{"name":0},{"name":1},{"name":2},{"name":3}],"edges":[{"source":0,"target":1},{"source":1,"target":2},{"source":2,"target":3},{"source":3,"target":null}]}'}

  describe '.generate' do
    context 'missing proper namespace' do
      it 'returns valid json' do
        graphml = File.read('spec/fixtures/graphml_without_namespacing.txt')
        Graphml2Json::generate(graphml).should == json
      end
    end

    context 'with namespace' do
      it 'returns valid json' do
        graphml = File.read('spec/fixtures/graphml_with_namespacing.txt')
        Graphml2Json::generate(graphml).should == json
      end
    end

    context 'with nodes' do
      let(:json){'{"nodes":[{"name":0,"color":"green"},{"name":1},{"name":2,"color":"blue"},{"name":3,"color":"red"},{"name":4},{"name":5,"color":"turquoise"}],"edges":[{"source":0,"target":2,"size":"1.0"},{"source":0,"target":1,"size":"1.0"},{"source":1,"target":3,"size":"2.0"},{"source":3,"target":2},{"source":2,"target":4},{"source":3,"target":5},{"source":5,"target":4,"size":"1.1"}]}'}

      it 'returns data as attributes' do
        graphml = File.read('spec/fixtures/attributes.graphml')
        Graphml2Json::generate(graphml).should == json
      end
    end
  end
end

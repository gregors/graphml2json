require 'spec_helper'
require 'graphml2json'

describe Graphml2Json do
  let(:json) {'{"nodes":[{"name":0},{"name":1},{"name":2},{"name":3}],"edges":[{"source":0,"target":1},{"source":1,"target":2},{"source":2,"target":3},{"source":3,"target":null}]}'}

  describe ".generate" do
    context "missing proper namespace" do
      it 'returns valid json' do
        graphml = File.read("spec/fixtures/graphml_without_namespacing.txt")
        Graphml2Json::generate(graphml).should == json
      end
    end

    context "with namespace" do
      it 'returns valid json' do
        graphml = File.read("spec/fixtures/graphml_with_namespacing.txt")
        Graphml2Json::generate(graphml).should == json
      end
    end
  end
end


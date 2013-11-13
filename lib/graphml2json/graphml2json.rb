require 'nokogiri'
require 'json'

class Graphml2Json

  def self.generate(xml_string) 
    doc = Nokogiri::XML(xml_string)
    doc.remove_namespaces!
    graph = doc.xpath('//graph')
    nodes = graph.xpath('//node')
    edges = graph.xpath('//edge')

    @mapping = {}
    @json_nodes = []

    @graph = {}
    @graph[:nodes] = [] 
    @graph[:edges] = [] 

    nodes.each_with_index do |n, index|
      @mapping[n[:id]] = index 
      @graph[:nodes] << {:name => index}
    end

    @json_edges = [] 
    edges.each do |e|
      source = @mapping[e[:source]]
      target = @mapping[e[:target]]
      @graph[:edges] << { :source => source, :target => target }
    end

    JSON.generate(@graph)
  end
end

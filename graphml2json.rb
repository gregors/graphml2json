require 'nokogiri'
require 'json'

class Graphml2Json

  def self.generate(xml_string) 
    doc = Nokogiri::XML(xml_string)
    graph = doc.xpath('//xmlns:graph')
    nodes = graph.xpath('//xmlns:node')
    edges = graph.xpath('//xmlns:edge')

    @mapping = {}
    @json_nodes = []

    @graph = {}
    @graph[:nodes] = [] 
    @graph[:edges] = [] 

    nodes.each_with_index do |n, index|
      @mapping[n[:id]] = index 
      @graph[:nodes] << {:name => index} #"{ name: \"#{index}\" },"
    end

    @json_edges = [] 
    edges.each do |e|
      source = @mapping[e[:source]]
      target = @mapping[e[:target]]
      #@json_edges << "{ source: \"#{source}\", target: \"#{target}\" }," 
      @graph[:edges] << { :source => source, :target => target }
    end

    JSON.generate(@graph)
  end
end

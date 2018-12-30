require 'nokogiri'
require 'json'

module Graphml2Json

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

      attributes = data_attributes(n)
      @mapping[n[:id]] = index
      new_node = {:name => index}.merge(attributes)
      @graph[:nodes] << new_node
    end

    @json_edges = []
    edges.each do |e|
      source = @mapping[e[:source]]
      target = @mapping[e[:target]]
      attributes = data_attributes(e)
      new_edge = { :source => source, :target => target }.merge(attributes)
      @graph[:edges] << new_edge
    end

    JSON.generate(@graph)
  end

  private

  def self.data_attributes(node)
    data_nodes = node.xpath('./data')

    attributes = data_nodes.map do |d|
      {d[:key] => d.text}
    end.inject(&:merge)

    attributes || {}
  end
end

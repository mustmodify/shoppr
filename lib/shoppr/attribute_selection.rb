module Shoppr
  class AttributeSelection
    include ROXML
    xml_convention {|val| val.camelize(:lower) }
    xml_reader :id, :from => '@id'
    xml_reader :name
    xml_reader :attribute_value_url, :from => 'attributeValueURL'
    xml_reader :dropped?, :from => :attr
  end
end
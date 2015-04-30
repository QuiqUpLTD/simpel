require 'simpel/version'
require 'simpel/tree'
require 'simpel/definition_proxy'

# This patch allows null keys to be serialized
require 'active_model/serialization'

module Simpel
  @registry = {}

  def self.registry
    @registry
  end

  def self.serialize(model, format)
    model.as_json(@registry[format].to_json)
  end

  def self.define(&block)
    definition_proxy = DefinitionProxy.new
    definition_proxy.instance_eval(&block)
  end

end

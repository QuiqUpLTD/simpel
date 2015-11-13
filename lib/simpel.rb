require 'simpel/version'
require 'simpel/tree'
require 'simpel/definition_proxy'

# This patch allows null keys to be serialized
require 'active_model/serialization'

module Simpel
  @registry = {}
  @file_registry = []

  def self.registry
    @registry
  end

  def self.serialize(model, format)
    model.as_json(@registry[format].to_json)
  end

  def self.clear_registry
    @registry = {}
  end

  def self.reload!
    files = @file_registry.dup
    @file_registry = []
    files.each { |f| load f }
  end

  def self.define(&block)
    if caller[0] && file_path = caller[0].split(':')[0]
      @file_registry << file_path
    end
    definition_proxy = DefinitionProxy.new
    definition_proxy.instance_eval(&block)
  end

end

require 'simpel/railtie' if defined?(::Rails)
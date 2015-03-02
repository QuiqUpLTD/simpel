module Simpel
  class Tree < BasicObject
    attr_reader :name

    def initialize(name = '')
      @name = name
      @trees = []
      @associations = []
      @attributes = []
      @methods = []
      @excluded_attributes = []
    end

    def has_many(association_name, &block)
      association = Tree.new(association_name)
      associate(association)
      association.instance_eval(&block) if block
    end

    def attributes(*attrs)
      @attributes = attrs
    end

    def methods(*methodz)
      @methods = methodz
    end

    def except(*attrs)
      @excluded_attributes = attrs
    end

    def to_json
      {}.tap do |result|

        result[:only] = @attributes unless @attributes.empty?
        result[:methods] = @methods unless @methods.empty?
        result[:except] = @excluded_attributes unless @excluded_attributes.empty?
        result[:include] = {} unless @associations.empty?

        @associations.each do |association|
          result[:include][association.name] = association.to_json
        end
      end
    end

    private

    def associate(association)
      @associations << association
    end

    alias_method :has_one, :has_many
    alias_method :attribute, :attributes
    alias_method :only, :attributes

  end
end
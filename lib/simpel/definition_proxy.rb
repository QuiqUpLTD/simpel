module Simpel
  class DefinitionProxy < BasicObject

    def root(serializer_key, &block)
      tree = Tree.new
      tree.instance_eval(&block)
      ::Simpel.registry[serializer_key] = tree
    end

  end
end
require 'singleton'

# module Kernel
#   def define_class(name, &blk)
#     klass = self.class.const_set(name, Class.new(&blk))
#   end
# 
#   def get_class(name)
#     self.class.const_get(name)
#   end
# end

class SingletonClass
  include Singleton
end

class SingletonFactory
  def self.makeSingleton name
    TestSingleton = Class.new(SingletonClass)
  end
  
end

SingletonFactory.makeSingleton("TestSingleton")
puts String.class
puts TestSingleton.class
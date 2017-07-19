require_relative 'firuta/with_collection'
require_relative 'firuta/without_collection'

module Firuta
  module_function

  def new(collection = nil)
    return with_collection(collection) unless collection.nil?
    without_collection
  end

  def with_collection(collection)
    WithCollection.new(collection)
  end

  def without_collection
    WithoutCollection.new
  end
end

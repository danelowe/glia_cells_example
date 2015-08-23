require 'yaml'
module Recipes
  class Recipe

    include FileEntity

    attr_accessor :data

    def initialize(directory, filename)
      super
      @data = YAML.load_file(file_name)
    end

    def respond_to_missing?(m, include_all)
      @data.key?(m)
    end

    protected

    def method_missing(m, *args, &block)
      if @data.key?(m)
        @data[m]
      else
        super
      end
    end

  end
end
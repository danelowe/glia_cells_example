module FileRepository
  def self.included base
    base.extend ClassMethods
  end

  module ClassMethods

    attr_accessor :directory, :entity_class, :file_extensions

    def all
      @files ||= Dir.glob(glob).map do |file|
        entity_class.new directory, file
      end
      @files
    end

    def glob
      raise 'Missing Directory' unless directory && (directory != '')
      "#{directory}/**/*.{#{file_extensions.join(',')}}"
    end

    def where(conditions = {})
      conditions = conditions.symbolize_keys
      conditions.assert_valid_keys valid_conditions
      all.select do |object|
        conditions.all? { |key, value| object.send(key) == value }
      end
    end

    def valid_conditions
      [:key, :format, :store]
    end

    def find(key, options = {})
      format = options[:format]
      where(key: key.to_s, format: format).first
    end

  end

end

module FileEntity
  attr_accessor :key, :file_name, :format, :type

  def initialize(directory, file_name)
    @file_name = file_name
    info = file_name.sub(directory+'/', '')
    (*slug, format, type) = info.split('.')
    @type = type.to_sym
    @format = slug.empty? ? nil : format.to_sym
    slug = slug.empty? ? format : slug.join('.')
    @key = slug.sub(/\/index$/, '')
  end
end
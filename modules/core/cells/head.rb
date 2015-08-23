require_relative './template'
module Core::Cells
  class Head < Template

    attr_accessor :title

    def title
      @title ||= 'Cocktails Layout Example'
    end

  end
end
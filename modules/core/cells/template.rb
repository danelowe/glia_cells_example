module Core::Cells
  class Template < Base
    include Cell::Haml

    def template_name
      @options[:template_name]
    end

  end
end

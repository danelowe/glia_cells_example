module Core::Cells
  class Blocks < Base

    include Haml::Helpers

    def render
      cell_exec
    end

  end
end
module Core::Cells
  class List < Base

    def render
      children.map{|name, child| child.render}.join
    end

  end
end

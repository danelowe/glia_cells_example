module Recipes
  module Cells
    class Preparation < Core::Cells::Template

      def preparation
        recipe.preparation.gsub("\n\r","<br />").gsub("\r", "").gsub("\n", "<br />")
      end

    end
  end
end
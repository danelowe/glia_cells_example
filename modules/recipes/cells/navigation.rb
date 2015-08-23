module Recipes
  module Cells
    class Navigation < Core::Cells::Template

      def category_name
        @category_name ||= recipe.category.split('_').collect{|word| word[0] = word[0].upcase; word}.join(' ')
      end

      def category_url
        @category_url ||= path(:recipes, category: recipe.category)
      end

      def recipes
        @recipes ||= Recipes::RecipeRepository.where(category: recipe.category)
      end

    end
  end
end

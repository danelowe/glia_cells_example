module Recipes
  class Show

    include Lotus::Action
    expose :recipe

    def call(params)
      @recipe = Recipes::RecipeRepository.find(params[:id].to_sym)
      handles << :"recipes_show_category_#{@recipe.category}"
      layout.cell(:head).title = @recipe.name
      RequestStore.store[:action_exposures] = exposures
      self.body = layout.cell(:root).render
    end
  end
end
module Recipes
  class Index

    include Lotus::Action
    expose :recipes

    def call(params)
      @recipes = Recipes::RecipeRepository.all
      layout.cell(:head).title = 'All Recipes'
      RequestStore.store[:action_exposures] = exposures
      self.body = layout.cell(:root).render
    end
  end
end
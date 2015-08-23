module Recipes
  class RecipeRepository

    include FileRepository
    self.directory = File.join(Application.root, 'content', 'recipes')
    self.file_extensions = %w[yaml yml]
    self.entity_class = Recipes::Recipe

    def self.valid_conditions
      super|[:category]
    end

  end
end


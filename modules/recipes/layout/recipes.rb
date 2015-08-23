Glia.area(:frontend) do

  view_namespace Core::Cells

  handle :recipes_index do
    reference name: :content do
      cell name: :recipes_index, class: :template, template_name: 'recipes/index'
    end
  end

  handle :recipes_show do
    reference name: :navigation do
      cell name: :sub_navigation, class: Recipes::Cells::Navigation, template_name: 'recipes/sub_navigation'
    end
    reference name: :content do
      cell name: :recipes_view, class: :template, template_name: 'recipes/show' do
        cell name: :ingredients, class: :template, template_name: 'recipes/show/ingredients'
        cell name: :recipes_prep, class: Recipes::Cells::Preparation, template_name: 'recipes/show/preparation', position: :preparation
      end
    end
  end

  handle :recipes_show_category_spirit do
    reference name: :recipes_view do
      cell name: :spirit_sidebar, class: :template, template_name: 'recipes/show/sidebar/spirit', position: :sidebar
    end
  end

  handle :recipes_show_category_ancestral do
    reference name: :recipes_view do
      cell name: :anc_sidebar, class: :template, template_name: 'recipes/show/sidebar/ancestral', position: :sidebar
    end
  end

  handle :recipes_show_category_sours do
    reference name: :recipes_view do
      cell name: :sours_sidebar, class: :template, template_name: 'recipes/show/sidebar/sours', position: :sidebar
    end
  end

end

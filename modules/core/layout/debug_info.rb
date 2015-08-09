Glia.area(:frontend) do

  view_namespace Core::Cells

  handle :default do
    reference name: :body_start do
      cell name: :debug_info, class: :template, template_name: 'application/debug_info'
    end
  end

end

Glia.area(:frontend) do

  view_namespace Core::Cells

  handle :default do
    cell name: :root, class: :template, template_name: 'application/root' do
      cell name: :head, class: :head, template_name: 'application/head'
      cell name: :body_start, class: :list
      cell name: :header, class: :template, template_name: 'application/header'
      cell name: :navigation, class: :template, template_name: 'application/navigation'
      cell name: :content, class: :list
      cell name: :footer, class: :template, template_name: 'application/footer'
      cell name: :body_end, class: :list do
        cell name: :body_end_scripts, class: :blocks
      end
    end
  end

end

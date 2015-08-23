Glia.area(:frontend) do

  view_namespace Pages::Cells

  handle :pages_show do
    reference name: :content do
      cell name: :page_detail, class: :show
    end
  end

end

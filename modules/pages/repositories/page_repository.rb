module Pages
  class PageRepository

    include FileRepository
    self.directory = File.join(Application.root, 'content', 'pages')
    self.file_extensions = %w[markdown haml]
    self.entity_class = Pages::Page

  end
end


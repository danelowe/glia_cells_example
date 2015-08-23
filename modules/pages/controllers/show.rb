module Pages
  class Show

    include Lotus::Action
    expose :page

    def call(params)
      path = params.instance_variable_get(:@env)['REQUEST_PATH'].sub(/^\//, '')
      path = :home if path == ''
      @page = Pages::PageRepository.find(path, format: :html)
      halt 404 if @page.nil?
      RequestStore.store[:action_exposures] = exposures
      self.body = layout.cell(:root).render
    end
  end
end
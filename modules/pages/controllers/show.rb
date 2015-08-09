module Pages
  class Show
    include Lotus::Action

    def call(params)
      RequestStore.store[:exposures] = exposures
      self.body = layout.cell(:root).render
    end
  end
end
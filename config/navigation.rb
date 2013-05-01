SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.dom_class = 'nav'
    Kuhsaft::Page.roots.published.each do |page|
      unless page.slug_de == 'home'
        primary.item page.id, page.title, page.link
      end
    end
  end
end

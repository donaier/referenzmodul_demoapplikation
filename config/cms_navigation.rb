# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.item :pages, Kuhsaft::Page.model_name.human(:count => 2), kuhsaft.cms_pages_path
    primary.item :references, t('cms.navigation.items.references'), cms_references_path
    primary.dom_class = 'nav'
  end
end


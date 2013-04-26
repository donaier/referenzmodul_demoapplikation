# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.item :pages, Kuhsaft::Page.model_name.human(:count => 2), kuhsaft.cms_pages_path
    primary.item :references, t('cms.navigation.items.references'), cms_references_path
    primary.item :reference_branches, t('cms.navigation.items.reference_branches'), cms_reference_branches_path
    primary.item :reference_services, t('cms.navigation.items.reference_services'), cms_reference_services_path
    primary.dom_class = 'nav'
  end
end


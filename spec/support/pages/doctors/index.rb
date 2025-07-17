# frozen_string_literal: true

module Pages
  module Doctors
    class Index < SitePrism::Page
      set_url '/doctors'

      element :page_title, 'h2.text-primary'

      section :categories_menu, 'ul.dropdown-menu.categories-menu' do
        element :all_categories_link, 'a.all-categories'
        element :category_link, 'a.ctegory-link'
      end

      sections :doctor_card, '.doctor-card' do
        element :avatar, 'img.img-shadow'
        element :name, '.name'
        element :category, '.category>a'
        element :expirience, '.expirience'
        element :description, '.description'
        element :workplace, '.workplace'
        element :workplace_address, '.workplace-address'
        element :appointment_button, '.btn-primary'
      end

      section :pagination, 'ul.pagination' do
        element :previous_page_button, '.page-item.prev>a'
        element :active_page_button, '.page-item.active>a'
        elements :page_item_button, '.page-item>a'
        element :next_page_button, '.page-item.next>a'
      end
    end
  end
end
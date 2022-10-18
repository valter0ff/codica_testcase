# frozen_string_literal: true

module Pages
  module HomePage
    class Index < SitePrism::Page
      set_url '/'

      section :header, 'header' do
        element :site_title, 'a.navbar-brand'
        element :home_link, 'a.home-link'
        element :categories_menu_button, 'a.categories-link'
        element :login_menu_button, 'a.login-menu-button'
        element :sign_up_link, 'a.sign-up-link'
        element :account_menu_button, 'a.account-menu-button'

        section :categories_menu, 'ul.dropdown-menu.categories-menu' do
          element :all_categories_link, 'a.all-categories'
          element :category_link, 'a.ctegory-link'
        end

        section :login_menu, 'ul.dropdown-menu.login-menu' do
          element :login_doctor_link, 'a.login-doctor-link'
          element :login_pacient_link, 'a.login-pacient-link'
        end

        section :account_menu, 'ul.dropdown-menu.account-menu' do
          element :pacients_link, 'a.pacients-link'
          element :appointments_link, 'a.appointments-link'
          element :profile_link, 'a.profile-link'
          element :logout_button, '.logout-button'
          element :logout_button_form, '.logout-form'
        end
      end

      section :footer, 'footer' do
        element :home_link, 'a.home-link>span'
        element :facebook_link, 'a .bi-facebook'
        element :twitter_link, 'a .bi-twitter'
        element :instagram_link, 'a .bi-instagram'
      end

      element :page_title, '.general-title>h2'
      element :doctors_index_link, '.doctors-link'
      element :login_doctor_link, 'a.login-doctor-link'
      element :login_pacient_link, 'a.login-pacient-link'
      element :popular_categories_title, '.popular-categories-title'

      section :popular_categories, '.popular-categories' do
        elements :category_link, 'a.ctegory-link'
      end
    end
  end
end

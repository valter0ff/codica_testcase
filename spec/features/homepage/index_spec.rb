# frozen_string_literal: true

RSpec.describe 'HomePages->Index', type: :feature do
  let(:home_page) { Pages::HomePage::Index.new }

  describe 'page elements' do
    let(:header) { home_page.header }
    let(:footer) { home_page.footer }

    context 'when permanent elememnts' do
      let(:categories) { I18n.t('categories_titles') }
      let(:categories_menu_block) { header.categories_menu }

      before do
        categories.map { |title| create(:category, title: title) }
        home_page.load
      end

      it 'header elements present' do
        expect(header).to have_site_title(text: I18n.t('partials.header.site_title'))
        expect(header).to have_home_link(text: I18n.t('partials.header.home_link'))
        expect(header).to have_categories_menu_button(text: I18n.t('partials.header.categories_link'))
        expect(header).to have_categories_menu
        expect(categories_menu_block).to have_all_categories_link(text: I18n.t('partials.header.all_categories'))
        categories.each do |category_title|
          expect(categories_menu_block).to have_category_link(text: category_title)
        end
      end

      it 'page body elements present' do
        expect(home_page).to have_page_title(text: I18n.t('homepage.index.general_title'))
        expect(home_page).to have_doctors_index_link(text: I18n.t('homepage.index.find_doctor'))
        expect(home_page).to have_popular_categories_title(text: I18n.t('homepage.index.popular_categories'))
        expect(home_page).to have_popular_categories
        expect(home_page.popular_categories).to have_category_link
      end

      it 'footer elements present' do
        expect(footer).to have_home_link(text: I18n.t('partials.footer.company'))
        expect(footer).to have_facebook_link
        expect(footer).to have_twitter_link
        expect(footer).to have_instagram_link
      end
    end

    context 'when nobody is logged in' do
      let(:login_menu_block) { header.login_menu }

      before { home_page.load }

      it 'header elements present' do
        expect(header).to have_login_menu_button(text: I18n.t('partials.header.login'))
        expect(header).to have_sign_up_link(text: I18n.t('partials.header.sign_up'))
        expect(header).to have_login_menu
        expect(login_menu_block).to have_login_doctor_link(text: I18n.t('partials.header.login_as_doctor'))
        expect(login_menu_block).to have_login_pacient_link(text: I18n.t('partials.header.login_as_pacient'))
      end

      it 'page body elements present' do
        expect(home_page).to have_login_doctor_link(text: I18n.t('homepage.index.login_as_doctor'))
        expect(home_page).to have_login_pacient_link(text: I18n.t('homepage.index.login_as_pacient'))
      end
    end

    context 'when doctor is logged in' do
      let(:doctor) { create(:doctor) }
      let(:account_menu_block) { header.account_menu }

      before do
        sign_in(doctor)
        home_page.load
      end

      it 'account menu elements present' do
        expect(header).to have_account_menu_button(text: doctor.name)
        expect(header).to have_account_menu
        expect(account_menu_block).to have_pacients_link(text: I18n.t('partials.header.pacients'))
        expect(account_menu_block).to have_appointments_link(text: I18n.t('partials.header.appointments'))
        expect(account_menu_block).to have_profile_link(text: I18n.t('partials.header.profile'))
        expect(account_menu_block).to have_logout_button(text: I18n.t('partials.header.logout'))
        expect(account_menu_block).to have_logout_button_form
        expect(account_menu_block.logout_button_form['action']).to eq(destroy_doctor_session_path)
        expect(account_menu_block.pacients_link['href']).to eq(doctors_pacients_path)
        expect(account_menu_block.appointments_link['href']).to include(doctors_appointments_path)
        expect(account_menu_block.profile_link['href']).to eq(doctors_profile_path)
      end
    end

    context 'when user is logged in' do
      let(:user) { create(:user) }
      let(:account_menu_block) { header.account_menu }

      before do
        sign_in(user)
        home_page.load
      end

      it 'account menu elements present' do
        expect(header).to have_account_menu_button(text: user.name)
        expect(header).to have_account_menu
        expect(account_menu_block).to have_appointments_link(text: I18n.t('partials.header.appointments'))
        expect(account_menu_block).to have_profile_link(text: I18n.t('partials.header.profile'))
        expect(account_menu_block).to have_logout_button(text: I18n.t('partials.header.logout'))
        expect(account_menu_block).to have_logout_button_form
        expect(account_menu_block.logout_button_form['action']).to eq(destroy_user_session_path)
        expect(account_menu_block.appointments_link['href']).to include(users_appointments_path)
        expect(account_menu_block.profile_link['href']).to eq(users_profile_path)
      end
    end
  end
end

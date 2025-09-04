# frozen_string_literal: true

RSpec.describe 'Doctors->Index', type: :feature do
  let(:page) { Pages::Doctors::Index.new }
  let!(:categories) { create_list(:category, categories_count, :with_doctors, doctors_count: doctors_count) }
  let(:categories_count) { rand(5..10) }
  let(:doctors_count) { rand(5..10) }

  before { page.load }

  describe 'page elements' do
    let(:doctor_card) { page.doctor_card.first }
    let(:pagination) { page.pagination }
    let(:doctor) { Doctor.first }

    it 'body elements present' do
      expect(page).to have_page_title(text: I18n.t('doctors.index.all_categories'))
      expect(page).to have_categories_menu
      expect(page).to have_doctor_card
      expect(page).to have_pagination
    end

    it 'doctor card elements present' do
      expect(doctor_card).to have_avatar
      expect(doctor_card).to have_name(text: doctor.name)
      expect(doctor_card).to have_category(text: doctor.category.title)
      expect(doctor_card).to have_expirience(text: I18n.t('doctors.doctor_card.expirience', count: doctor.expirience))
      expect(doctor_card).to have_description(text: doctor.description)
      expect(doctor_card).to have_workplace(text: doctor.workplace)
      expect(doctor_card).to have_workplace_address(text: doctor.workplace_address)
      binding.pry
      expect(doctor_card).to have_appointment_button
      expect(doctor_card.appointment_button.value).to eq(I18n.t('doctors.doctor_card.book_appointment'))
    end

    it 'pagination block elements present' do
      expect(pagination).to have_previous_page_button
      expect(pagination).to have_active_page_button
      expect(pagination).to have_page_item_button
      expect(pagination).to have_next_page_button
    end
  end
end

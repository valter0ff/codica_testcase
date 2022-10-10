ActiveAdmin.register Appointment do
  permit_params :user_id, :doctor_id, :status, :body

  scope :all, default: true
  scope :active
  scope :closed

  index do
    selectable_column
    column :id
    column :user
    column :doctor
    tag_column :status, interactive: true
    column :body
    actions
  end
end

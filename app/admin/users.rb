ActiveAdmin.register User do
  permit_params :phone_number, :password, :password_confirmation, :name
end

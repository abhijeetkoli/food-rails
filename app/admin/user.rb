ActiveAdmin.register User do


  permit_params :first_name, :last_name, :phone

  index do
    selectable_column
    id_column
    column :email
    column :first_name
    column :last_name
    column :phone
    column :type
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :first_name
  filter :last_name
  filter :phone
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "User Details" do
      f.input :first_name
      f.input :last_name
      f.input :phone
    end
    f.actions
  end


end

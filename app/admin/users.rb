# coding: utf-8
ActiveAdmin.register User do

    index do
      column :email
      column :current_sign_in_at
      column :last_sign_in_at
      column :sign_in_count
      default_actions
    end

    filter :email

    form do |f|
      f.inputs "用户资料" do
        f.input :email
        f.input :password
        f.input :password_confirmation
      end
      f.actions
    end


end
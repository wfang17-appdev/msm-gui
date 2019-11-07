Rails.application.routes.draw do
  
  

  # ====== Routes for Admin Dashboard ==============
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end

Rails.application.routes.draw do

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
    get 'top' => 'homes#top', as: 'top'

    resources :posts, only: [:index, :show, :destroy]
    resources :members, only: [:index, :show, :edit, :update]
    resources :comments, only: [:index, :show, :destroy]
    resources :worlds
 end


# 顧客用
# URL /members/sign_in ...
devise_for :members, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

scope module: :public do
    root 'homes#top'
    get 'guests/sign_in' => 'homes#new_guest', as: 'guest'
    get 'members'  => 'members#show', as: 'mypage'
    get 'members/information/edit' => 'members#edit', as: 'edit_information'
    get 'members/unsubscribe' => 'members#unsubscribe', as: 'unsubscribe'
    patch 'members/withdraw' => 'members#withdraw', as: 'withdraw_member'
    patch 'members/information' => 'members#update', as: 'update_information'

    resources :posts
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
    resources :worlds, only: [:index, :show]
  end

end

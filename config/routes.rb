Rails.application.routes.draw do
  # ユーザー用
  devise_for :members, skip: [:passwords], controllers: {
    sessions:      'public/sessions',
    registrations: 'public/registrations'
  }

  devise_scope :member do
      post  'guests/sign_in' => 'public/sessions#new_guest', as: 'guest'
    end

  scope module: :public do
      root to: 'homes#top'

      get   'members'                  => 'members#show',        as: 'mypage'
      get   'members/information/edit' => 'members#edit',        as: 'edit_information'
      get   'members/unsubscribe'      => 'members#unsubscribe', as: 'unsubscribe'
      patch 'members/withdraw'         => 'members#withdraw',    as: 'withdraw_member'
      patch 'members/information'      => 'members#update',      as: 'update_information'
      get   'post/hashtag/:name'       => 'posts#hashtag',       as: 'hashtag'
      get   'posts/search'             => 'posts#search',        as: 'search'

      resources :posts do
        resource :favorites, only: [:create, :destroy]
        resource :comments,  only: [:create]
      end

      resources :comments,   only: [:destroy]
      resources :categories, only: [:index]
    end

  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: 'admin/sessions'
    }

  namespace :admin do
      get 'top' => 'homes#top', as: 'top'
      get 'hashtag/:name' => 'posts#hashtag', as: 'hashtag'

      resources :posts,       only: [:index, :show, :destroy]
      resources :members,     only: [:index, :show, :edit, :update]
      resources :comments,    only: [:index, :show, :destroy]
      resources :categories,  only: [:index, :create, :edit, :update]
    end

end
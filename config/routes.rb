Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  namespace :admin do

    resources :comments,only:[:index,:show,:edit,:update,:destroy]

    resources :post_images,only:[:index,:show,:edit,:update,:destroy]

    resources :users,only:[:index,:show,:edit,:update]
    get 'users/:id/comments' => "users#comments", as: :users_comments
    get 'users/:id/favorites' => "users#favorites", as: :users_favorites


    get 'search' => 'searchs#search'

    root to: "homes#top"
  end
  scope module: :public do

    resources :searchs,only:[:index]
    get 'search' => 'searchs#search'

    get 'rankings/gekidann'
    get 'rankings/yakusya'

    resources :post_images,only:[:new,:create,:index,:show,:edit,:update,:destroy] do
      resource :favorites,only:[:create,:destroy]
      resources :comments,only:[:new,:create,:show,:edit,:update,:destroy]
    end

    resources :users,only:[:show,:edit,:update]

    get 'users/:id/comments' => "users#comments", as: :users_comments
    get 'users/:id/favorites' => "users#favorites", as: :users_favorites

    root to: "homes#top"
    get 'about' => "homes#about"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

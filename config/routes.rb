Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  Rails.application.routes.draw do
    get 'posts/test', to: 'api/v1/posts#test'
    get 'posts/amos', to: 'api/v1/posts#amos'
    get 'posts/teamo', to: 'api/v1/posts#teamo'

    namespace 'api' do
      namespace 'v1' do
        resources :posts
      end
    end
  end
end

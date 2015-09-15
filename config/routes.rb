Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  root to: "targets#index"
  resources :targets do
      resources :tasks do
         patch :sort
          resources :todos do
            patch :sort
          end
      end
  end
  patch '/targets/:target_id/tasks/:task_id/todos/:id(.:format)/achieve' => 'todos#achieve'
  get 'contact' => 'contact#index'
  post 'contact/confirm' => 'contact#confirm'
  post 'contact/thanks' => 'contact#thanks'

end
Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  root to: "targets#index"
  resources :targets do
    resources :tasks do
      resources :todos
    end
  end
  patch '/targets/:target_id/tasks/:task_id/todos/:id(.:format)/achieve' => 'todos#achieve'
end
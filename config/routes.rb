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

  #お問い合わせ
  get 'contact' => 'contact#index'              # 入力画面
  post 'contact/confirm' => 'contact#confirm'   # 確認画面
  post 'contact/thanks' => 'contact#thanks'     # 送信完了画面

end
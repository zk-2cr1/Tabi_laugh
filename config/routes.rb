Rails.application.routes.draw do
# 顧客用
# URL /customers/sign_in ...
devise_for :members, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, controllers: {
  sessions: "admin/sessions"
}
end

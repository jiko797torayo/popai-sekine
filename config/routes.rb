Rails.application.routes.draw do
  get '/health', controller: :elb, action: :health
  root to: 'welcome#index'
end

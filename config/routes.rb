Rails.application.routes.draw do
  get '/health', controller: :elb, action: :health
end

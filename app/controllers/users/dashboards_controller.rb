class Users::DashboardsController < UsersController
  before_action :comment_confirm, only: [:index]
end

class ApplicationController < ActionController::Base
  before_action :set_raven_context

  def self.render_with_signed_in_user(user_id, *args)
    user = User.find(user_id)
    ActionController::Renderer::RACK_KEY_TRANSLATION['warden'] ||= 'warden'
    proxy = Warden::Proxy.new({}, Warden::Manager.new({})).tap { |i| i.set_user(user, scope: :user) }
    renderer = self.renderer.new('warden' => proxy)
    renderer.render(*args)
  end

  private

  def set_raven_context
    Raven.user_context(id: current_user&.id, email: current_user&.email)
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end

  def store_current_location
    store_location_for(:user, request.url)
  end
end

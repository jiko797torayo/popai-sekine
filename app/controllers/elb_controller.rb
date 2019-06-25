class ElbController < ApplicationController
  def health
    render plain: 'ok'
  end
end

class NewslettersController < ApplicationController
  before_filter :authenticate_user!

  def index
    newsletters = Newsletter.all

    render json: newsletters.to_json(include: :entries)
  end
end
class NewslettersController < ApplicationController

  def index
    newsletters = Newsletter.all

    render json: newsletters.to_json(include: :entries)
  end
end
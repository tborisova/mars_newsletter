class EntriesController < ApplicationController
  before_filter :authenticate_user!

  def create
    entry = current_user.entries.create(entry_params)
    render json: entry
  end

  def entry_params
    params.require(:entry).permit(:title, :body)
  end
end
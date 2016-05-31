class CommentsController < ApplicationController
  def create
    render json: params
  end

  def destroy
    render json: params
  end
end

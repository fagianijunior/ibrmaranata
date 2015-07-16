class AboutController < ApplicationController
  def index
    @about = Post.first
  end
end

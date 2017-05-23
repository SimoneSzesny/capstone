class Api::V1::ColorsController < ApplicationController
  def index
    @colors = Color.all
    render "index.json.jbuilder"
  end
end

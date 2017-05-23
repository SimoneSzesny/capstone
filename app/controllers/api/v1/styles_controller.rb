class Api::V1::StylesController < ApplicationController
  def index
    @styles = Style.all
    render "index.json.jbuilder"
  end
end

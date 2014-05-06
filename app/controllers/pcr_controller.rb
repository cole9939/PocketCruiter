class PcrController < ApplicationController
  before_filter :authenticate_user!, only: [:show ]
  
  def index
    @templates = Template.all.order(title: :desc)
  end
  
  def show
    @template = Template.find(params[:id])
  end
end

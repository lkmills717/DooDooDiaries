class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  layout "signup", only: :home
  
  def about
    render params[:about]
  end

end

class DynamicPagesController < ApplicationController
  def home
    params[:user] = User.find(params[:id]) #POUR LA RECHERCHE EN BDD
  end
end

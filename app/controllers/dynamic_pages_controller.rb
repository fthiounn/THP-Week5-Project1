class DynamicPagesController < ApplicationController
  def home
    params[:user] = User.find(params[:id]) #POUR LA RECHERCHE EN BDD
  end
  def gossip   
    params[:gossip] = Gossip.find(params[:id])
    params[:comments] = Comment.where(gossip_id: params[:id]).all
  end
  def user
    params[:user] = User.find(params[:id])
  end
end

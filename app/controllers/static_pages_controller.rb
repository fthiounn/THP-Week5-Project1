class StaticPagesController < ApplicationController
  def home
    params[:gossip_array] = Gossip.all
  end
  def team
  end
  def contact
  end
end

class ProfilesController < ApplicationController

  before_filter :authenticate_user!
  
  respond_to :html, :xml, :json

end

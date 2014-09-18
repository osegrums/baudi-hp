class BackEndController < ApplicationController
  before_action :authenticate_user!

  layout 'back_end'
end

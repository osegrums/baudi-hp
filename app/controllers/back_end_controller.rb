class BackEndController < ApplicationController
  before_action :authenticate_user!

  layout 'back_end'

  private

  def set_locale
    I18n.locale = :en
  end
end

module AdminPages
  class BaseController < ApplicationController
    before_action :authenticate_admin_user!
  end
end

# app/controllers/dev/pages_controller.rb
module Dev
  class PagesController < ApplicationController
    def index
      redirect_to dev_etymology_path
    end

    def etymology
    end
  end
end

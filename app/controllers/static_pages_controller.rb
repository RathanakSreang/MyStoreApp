class StaticPagesController < ApplicationController
  before_action :load_store
  def home
  end

  def help
  end

  def about   
  end

  def contact
  end
end

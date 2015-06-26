class StaticPagesController < ApplicationController

  def home
  end

  def help
  end

  def about
    if request.subdomain.present? && request.subdomain != "www"
      sub_domain = SubDomain.find_by_name request.subdomain
      if sub_domain
        @store = sub_domain.store
      else
        redirect_to root_path
      end
    end
  end

  def contact
  end
end

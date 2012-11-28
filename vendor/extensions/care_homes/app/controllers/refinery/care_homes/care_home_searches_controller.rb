module Refinery
  module CareHomes
    class CareHomeSearchesController < ::ApplicationController

      def create
        @care_homes = CareHome.near_postcode(params[:postcode])
        # @page = ::Refinery::Page.where(:link_url => "/care_homes").first
        # present(@page)
        render 'refinery/care_homes/care_homes/index'
      end

    end
  end
end

module Refinery
  module CareHomes
    class CareHomeSearchesController < ::ApplicationController

      def create
        @care_homes = CareHome.near_postcode(params[:postcode])
        @page = ::Refinery::Page.find_by_path(refinery.care_homes_care_homes_path)
        present(@page)
        render 'refinery/care_homes/care_homes/index'
      end

    end
  end
end

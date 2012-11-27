module Refinery
  module CareHomes
    class CareHomesController < ::ApplicationController

      before_filter :find_all_care_homes
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @care_home in the line below:
        present(@page)
      end

      def show
        @care_home = CareHome.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @care_home in the line below:
        present(@page)
      end

    protected

      def find_all_care_homes
        @care_homes = CareHome.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/care_homes").first
      end

    end
  end
end

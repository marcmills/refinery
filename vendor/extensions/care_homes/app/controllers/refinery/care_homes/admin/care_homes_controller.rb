module Refinery
  module CareHomes
    module Admin
      class CareHomesController < ::Refinery::AdminController

        crudify :'refinery/care_homes/care_home',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end

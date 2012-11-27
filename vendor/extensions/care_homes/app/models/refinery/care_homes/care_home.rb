module Refinery
  module CareHomes
    class CareHome < Refinery::Core::BaseModel
      self.table_name = 'refinery_care_homes'

      attr_accessible :name, :address, :town, :postcode, :position

      acts_as_indexed :fields => [:name, :address, :town, :postcode]

      validates :name, :presence => true, :uniqueness => true
    end
  end
end

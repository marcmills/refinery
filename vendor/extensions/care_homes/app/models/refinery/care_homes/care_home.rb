module Refinery
  module CareHomes
    class CareHome < Refinery::Core::BaseModel
      require 'geocoder'
      self.table_name = 'refinery_care_homes'
      attr_accessible :name, :address, :town, :postcode, :position
      acts_as_indexed :fields => [:name, :address, :town, :postcode]
      validates :name, :presence => true, :uniqueness => true
      
      geocoded_by :postcode
      after_validation :geocode
      
      def self.near_postcode(postcode)
        return Array.new if postcode.blank?
        CareHome.near(postcode, 1000).limit(3)
      end
    end
  end
end

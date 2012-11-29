# This migration comes from refinery_care_homes (originally 20121128103600)
class AddLatitudeAndLongitudeToCareHome < ActiveRecord::Migration
  def change
    add_column :refinery_care_homes, :latitude, :float
    add_column :refinery_care_homes, :longitude, :float
  end
end

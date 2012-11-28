class AddLatitudeAndLongitudeToCareHome < ActiveRecord::Migration
  def change
    add_column :refinery_care_homes, :latitude, :float
    add_column :refinery_care_homes, :longitude, :float
  end
end

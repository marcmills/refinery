class CreateCareHomesCareHomes < ActiveRecord::Migration

  def up
    create_table :refinery_care_homes do |t|
      t.string :name
      t.string :address
      t.string :town
      t.string :postcode
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-care_homes"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/care_homes/care_homes"})
    end

    drop_table :refinery_care_homes

  end

end

class CreateLocation < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.st_polygon :area, srid: 4326, geographic: true
    end
  end
end

class CreateProfileData < ActiveRecord::Migration[7.0]
  def change
    create_table :profile_data do |t|
      t.belongs_to :profile, null: false, foreign_key: true
      t.belongs_to :profile_section, null: false, foreign_key: true
      t.string :title
      t.string :subtitle
      t.date :start_date
      t.date :end_date
      t.string :location
      t.string :description
      t.string :items

      t.timestamps
    end
  end
end

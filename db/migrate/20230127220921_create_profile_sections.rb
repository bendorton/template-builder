class CreateProfileSections < ActiveRecord::Migration[7.0]
  def change
    create_table :profile_sections do |t|
      t.string :type
      t.string :title
      t.integer :priority
      t.string :description

      t.timestamps
    end
  end
end

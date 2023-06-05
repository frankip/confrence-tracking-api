class CreateConferences < ActiveRecord::Migration[7.0]
  def change
    create_table :conferences do |t|
      t.string :reference_number
      t.string :ministry_in_charge
      t.string :number
      t.string :email
      t.string :location
      t.string :time
      t.string :date
      t.string :image
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end

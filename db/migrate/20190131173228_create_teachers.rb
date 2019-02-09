class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :salary
      t.string :school

      t.timestamps
    end
  end
end

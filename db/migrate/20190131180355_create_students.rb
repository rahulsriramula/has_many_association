class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name
      t.integer :teacher_id
      t.string :school

      t.timestamps
    end
  end
end

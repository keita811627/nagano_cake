class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|

      ##カラムの追加
      t.string :name

      t.timestamps
    end
  end
end

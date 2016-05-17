class CreateRels < ActiveRecord::Migration[5.0]
  def change
    create_table :rels do |t|
      t.references :rel_type, foreign_key: true
      t.references :node1, class_name: 'Subject'
      t.references :node2, class_name: 'Subject'

      t.timestamps
    end
  end
end

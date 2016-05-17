class Rel < ApplicationRecord
  belongs_to :rel_type
  belongs_to :node1, class_name: 'Subject'
  belongs_to :node2, class_name: 'Subject'
end

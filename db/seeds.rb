RelType.create!([
  {name: "содержит"},
  {name: "относится к"}
])
SubType.create!([
  {name: "Requirement"},
  {name: "NFR"},
  {name: "SBS"},
  {name: "PBS"},
  {name: "Root"}
])
Subject.create!([
  {name: "требование 1", sub_type_id: 1},
  {name: "требование 1.1", sub_type_id: 1},
  {name: "требование 1.2", sub_type_id: 1},
  {name: "PBS element", sub_type_id: 4},
  {name: "PBS element 1.1", sub_type_id: 4},
  {name: "PBS element 1.2", sub_type_id: 4},
  {name: "Требования", sub_type_id: 5}
])
Rel.create!([
  {rel_type_id: 1, node1_id: 1, node2_id: 2},
  {rel_type_id: 1, node1_id: 1, node2_id: 3},
  {rel_type_id: 2, node1_id: 2, node2_id: 1},
  {rel_type_id: 2, node1_id: 3, node2_id: 1},
  {rel_type_id: 1, node1_id: 4, node2_id: 5},
  {rel_type_id: 1, node1_id: 4, node2_id: 6},
  {rel_type_id: 1, node1_id: 7, node2_id: 1},
  {rel_type_id: 1, node1_id: 7, node2_id: 4}
])

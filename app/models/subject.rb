class Subject < ApplicationRecord
  belongs_to :sub_type
  has_many :inputs,  -> {order('rel_type_id').includes(:rel_type, :node1)}, class_name: 'Rel', foreign_key: :node2_id
  has_many :outputs, -> {order('rel_type_id').includes(:rel_type, :node2)}, class_name: 'Rel', foreign_key: :node1_id 
  has_many :to, class_name: 'Subject', through: :outputs, source: :node2 
  has_many :from, class_name: 'Subject', through: :inputs, source: :node1

  has_many :rels_out, -> {group(:rel_type)}, class_name: 'Rel', foreign_key: :node1_id 
  has_many :rels_in,  -> {group(:rel_type)}, class_name: 'Rel', foreign_key: :node2_id 


  def each_relation _side, level=0, cache={}, &block
    side = case _side
           when :in;  inputs
           when :out; outputs
           end
    p side.count, level  
    return if side.count == 0
    
    yield state: :new_level, level: level, node: self
    
    count_rels = rels_out.count
    last_section = nil
    new_level = true
    
    side.find_each do |rel|
      break if cache.has_key? rel
      cache[rel] = nil
      p !last_section.nil? 
      p last_section != rel.rel_type
      p "**************************" if !last_section.nil? #and last_section != rel.rel_type
 
      yield state: :end_rel, rel: last_section, count: count_rels[last_section], level: level if !last_section.nil? and last_section != rel.rel_type
      yield state: :new_rel, rel: rel.rel_type, count: count_rels[rel.rel_type], level: level if (last_section!=rel.rel_type)
      yield state: :start_node, node: rel.node2, level: level
      last_section = rel.rel_type
      rel.node2.each_relation _side, level+1, cache, &block
      yield state: :end_node, node: rel.node2, level: level
      new_level = false
    end
    yield state: :end_rel, rel: last_section, count: count_rels[last_section], level: level if !last_section.nil?
    yield state: :end_level, level: level, node: self
  end

  def change_name
    puts name
    puts name?
    puts self.name
    name = "new name"
    puts name.changed?
    self.name = "new name"
    puts self.name.changed?
    save!
  end

end


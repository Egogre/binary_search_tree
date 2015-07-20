class Node
  attr_reader :left_child, :right_child
  attr_accessor :value, :times_used
  
  def initialize(node_parameters)
    @value = node_parameters[:node_value] 
    @times_used = 1
  end
  
  def set_new_node(node_value)
    if node_value == value
      @times_used += 1
    elsif node_value < value
      set_left_child(node_value)
    else
      set_right_child(node_value)
    end
  end
  
  def count_nodes
    node_self = 1
    node_self + left_count + right_count
  end
  
  def find_min
    min_value = value
    if left_child
      min_value = left_child.find_min
    end
    min_value
  end
  
  def find_max
    max_value = value
    if right_child
      max_value = right_child.find_max
    end
    max_value
  end
  
  def can_find?(search_value)
    @@value_found = false
    if value == search_value
      @@value_found = true
    elsif right_child && search_value > value
      right_child.can_find?(search_value)
    elsif left_child && search_value < value
      left_child.can_find?(search_value)
    end
    @@value_found
  end
  
  def find_and_remove_node(node_value_to_remove)
    if value == node_value_to_remove
      @times_used -= 1
    elsif right_child && (node_value_to_remove > value)
      right_child.find_and_remove_node(node_value_to_remove)
      if right_child.value == node_value_to_remove
        right_child.value = nil
      end
    elsif left_child && (node_value_to_remove < value)
      left_child.find_and_remove_node(node_value_to_remove)
      if left_child.value == node_value_to_remove
        left_child.value = nil
      end
    else
      "Node already doesn't exist!"
    end
    if times_used == 0
      delete_node
    end
  end
  
  def delete_node
    if right_child
      right_children = right_child.find_ascending_order.split("\n")
      left_children = left_child.find_ascending_order.split("\n") if left_child
      @value = right_child.value
      @left_child = nil
      @right_child = nil
      right_children.each {|child| set_new_node(child.to_i)}
      left_children.each {|child| set_new_node(child.to_i)} if left_child
      @times_used -= 1
      "Node deleted, children reassigned"
    elsif left_child
      left_children = left_child.find_ascending_order.split("\n") 
      @value = left_child.value
      @left_child = nil
      left_children.each {|child| set_new_node(child.to_i)}
      @times_used -= 1
      "Node deleted, children reassigned"
    else
      "Node deleted"
    end  
  end
  
  def total_height
    node_self = 1
    if right_child && left_child
      greater_height + node_self
    elsif right_child
      node_self + right_child.total_height
    elsif left_child
      node_self + left_child.total_height
    else
      node_self
    end
  end
  
  def find_by_height(level)
    all_at_level ||= ""
    if level == 1
      all_at_level += "#{value}\n"
    elsif left_child && right_child
      level -= 1
      all_at_level += "#{left_child.find_by_height(level)}"
      all_at_level += "#{right_child.find_by_height(level)}"
    elsif left_child
      level -= 1
      all_at_level += "#{left_child.find_by_height(level)}"
      all_at_level += " \n"
    elsif right_child
      level -= 1
      all_at_level += " \n"
      all_at_level += "#{right_child.find_by_height(level)}"
    end
      
  end
  
  def display_all
    height_count = 0
    display_output = ""
    nodes_possible = 2**total_height
    buffer = ("    " * (nodes_possible))
    total_height.times do
      buffer = buffer[0..-((buffer.length / 2)+1)]
      height_count += 1
      values_for_line = find_by_height(height_count).gsub("\n", buffer)
      display_output += "#{buffer}#{values_for_line}\n      "  
    end
    display_output
  end 
  
  def find_ascending_order
    ascending_return ||= ""
    if left_child
      ascending_return += left_child.find_ascending_order
    end
    ascending_return += "#{value}\n"
    if right_child
      ascending_return += right_child.find_ascending_order
    end
    ascending_return
  end
  
  private
  
  def set_left_child(left_child_value)
    if left_child
      left_child.set_new_node(left_child_value)
    else
      args = {:node_value => left_child_value}
      @left_child = Node.new(args)
    end
  end
  
  def set_right_child(right_child_value)
    if right_child
      right_child.set_new_node(right_child_value)
    else
      args = {:node_value => right_child_value}
      @right_child = Node.new(args)
    end
  end
  
  def left_count
    if left_child
      self.left_child.count_nodes
    else
      0
    end
  end
  
  def right_count
    if right_child
      self.right_child.count_nodes
    else
      0
    end
  end
  
  def greater_height
    if right_child.total_height >= left_child.total_height
      right_child.total_height
    else
      left_child.total_height
    end
  end
  
end

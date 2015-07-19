class Node
  attr_reader :value, :left_child, :right_child
  attr_accessor :times_used
  
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
  
end

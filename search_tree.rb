require './node'

class SearchTree
  attr_accessor :tree_HEAD
  
  def set_node(value)
    if tree_HEAD
      @tree_HEAD.set_new_node(value)
    else
      args = {:node_value => value}
      @tree_HEAD = Node.new(args)
    end
    #if tree_HEAD hand new node to HEAD
    #otherwise tree_HEAD = Node.new (value)
  end
  
  def show_nodes
    
  end
  
  def node_count
    tree_HEAD.count_nodes
  end
  
  def minimum_value
    tree_HEAD.find_min
  end
  
  def maximum_value
    tree_HEAD.find_max
  end
  
  def find_value(search_value)
    tree_HEAD.can_find?(search_value)
  end
  
  
end

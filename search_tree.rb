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
  
  def node_count
    tree_HEAD.count_nodes
  end
  
  def minimum_value
    tree_HEAD.find_min
  end
  
  
  
  
end

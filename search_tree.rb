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
  end
  
  def show_nodes 
     tree_HEAD.display_all
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
  
  def delete_node(node_value)
    tree_HEAD.find_and_remove_node(node_value)
  end
  
  def tree_height
    tree_HEAD.total_height
  end
  
  def get_leaves
    tree_HEAD.find_leaves
  end
  
  def print_ascending
    text = tree_HEAD.find_ascending_order
    random_number = rand(1000).to_s
    file = File.new('./test' + random_number, 'w')
    file.write(text)
    file.flush
    file
  end
  
  
end

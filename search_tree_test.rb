require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './search_tree'

class SearchTreeTest < Minitest::Test
  attr_reader :tree
  
  def setup
    @tree = SearchTree.new
  end
  
  def test_it_starts_a_search_tree
    tree.set_node(6)
    
    assert tree.tree_HEAD 
  end
  
  def test_it_sets_second_node
    tree.set_node(6)
    tree.set_node(3)
    
    expected = 2
    actual = tree.node_count
    
    assert_equal expected, actual
  end
  
  def test_it_knows_how_many_nodes_are_in_tree
    tree.set_node(6)
    tree.set_node(3)
    tree.set_node(2)
    tree.set_node(5)
    tree.set_node(4)
    
    expected = 5
    actual = tree.node_count
    
    assert_equal expected, actual
  end
  
  def test_it_knows_min_value
    skip
    tree.set_node(6)
    tree.set_node(3)
    tree.set_node(2)
    tree.set_node(5)
    tree.set_node(4)
    
    expected = 2
    actual = tree.minimum_value
    
    assert_equal expected, actual
  end
  
end

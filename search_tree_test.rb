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
    # skip
    tree.set_node(6)
    tree.set_node(3)
    tree.set_node(2)
    tree.set_node(5)
    tree.set_node(4)
    
    expected = 2
    actual = tree.minimum_value
    
    assert_equal expected, actual
  end
  
  def test_it_knows_max_value
    # skip
    tree.set_node(16)
    tree.set_node(13)
    tree.set_node(22)
    tree.set_node(15)
    tree.set_node(14)
    
    expected = 22
    actual = tree.maximum_value
    
    assert_equal expected, actual
  end
  
  def test_it_finds_value_in_tree
    # skip
    tree.set_node(6)
    tree.set_node(3)
    tree.set_node(2)
    tree.set_node(5)
    tree.set_node(4)

    refute tree.find_value(1)
    
    tree.set_node(1)
    
    assert tree.find_value(1)
  end
  
  def test_it_removes_value_from_tree
    tree.set_node(6)
    tree.set_node(3)
    tree.set_node(2)
    tree.set_node(5)
    tree.set_node(4)
    
    assert tree.find_value(6)
    
    tree.delete_node(6)
    
    refute tree.find_value(6)
    
    expected = 3
    actual = tree.tree_HEAD.value
    assert_equal expected, actual
  end
  
  def test_it_find_tree_height
    tree.set_node(6)
    tree.set_node(3)
    tree.set_node(2)
    tree.set_node(5)
    tree.set_node(4)
    
    expected = 4
    actual = tree.tree_height
    
    assert_equal expected, actual
  end
  
  def test_it_prints_small_tree_representation
    # skip
    tree.set_node(6)
    tree.set_node(11)
    tree.set_node(2)
    
    expected =
    "        6        
          2    11    
      "
    actual = tree.show_nodes
    
    assert_equal expected, actual
  end
  
  def test_it_prints_larger_tree_representation
    # skip
    tree.set_node(12)
    tree.set_node(11)
    tree.set_node(2)
    tree.set_node(5)
    tree.set_node(4)
    tree.set_node(16)
    tree.set_node(13)
    tree.set_node(22)
    tree.set_node(15)
    tree.set_node(14)
    
    expected =
    "                                                                12                                                                
                                      11                                16                                
                      2                                 13                22                
                       5                          15        
               4                   14         
      "
    actual = tree.show_nodes
    
    assert_equal expected, actual
  end
  
end

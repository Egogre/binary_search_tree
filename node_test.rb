require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './node'

class NodeTest < Minitest::Test
  attr_reader :node
  
  def setup
    args = {:node_value => 6}
    @node = Node.new(args)
    node.set_new_node(12)
    node.set_new_node(3)
  end
  
  def test_it_creates_node_with_value    
    expected = 6
    actual = node.value
    
    assert_equal expected, actual
  end
  
  def test_it_counts_children
    expected = 3
    actual = node.count_nodes
    
    assert_equal expected, actual
  end
  
  def test_you_cant_change_node_value
    skip
    node.value = 14
    refute node.value == 14
  end
  
  def test_node_knows_child_nodes        
    expected_left = 3
    expected_right = 12
    actual_left = node.left_child.value
    actual_right = node.right_child.value
    
    assert_equal expected_left, actual_left
    assert_equal expected_right, actual_right
  end
  
  def test_it_gets_left_childs_children
    
  end
  

  
end

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
  
  def test_node_knows_child_nodes        
    expected_left = 3
    expected_right = 12
    actual_left = node.left_child.value
    actual_right = node.right_child.value
    
    assert_equal expected_left, actual_left
    assert_equal expected_right, actual_right
  end
  
  def test_it_gets_min
    node.set_new_node(1)
    node.set_new_node(2)
    node.set_new_node(7)
    
    expected = 1
    actual = node.find_min
    
    assert_equal expected, actual
  end
  
  def test_it_gets_max
    node.set_new_node(17)
    node.set_new_node(22)
    node.set_new_node(7)
    
    expected = 22
    actual = node.find_max
    
    assert_equal expected, actual
  end
  
  def test_it_searches_for_value
    # skip
    refute node.can_find?(17)
    
    node.set_new_node(17)
  
    assert node.can_find?(17)
  end
  
  def test_it_finds_and_removes_node_by_value
    node.find_and_remove_node(12)
    
    refute node.can_find?(12)
  end
  
  def test_node_finds_height
    expected = 2
    actual = node.total_height
    
    assert_equal expected, actual
  end
  
  def test_it_gets_child_node_values_based_on_height
    expected = 
"3
12
"

    actual = node.find_by_height(2)
    
    assert_equal expected, actual
  end
  
  def test_find_all_leaves
    expected =
"3
12
"
    
    actual = node.find_leaves
    
    assert_equal expected, actual 
  end
  
  def test_node_displays_self_and_below
    # skip
    node.set_new_node(17)
    node.set_new_node(22)
    node.set_new_node(7)
    node.set_new_node(2)
    node.set_new_node(4)
    node.set_new_node(1)
    node.set_new_node(5)
    node.set_new_node(15)
    node.set_new_node(9)
    
    expected =
"                                6                                
                      3                12                
              2        4        7        17        
          1              5         9    15    22    
      "
    actual = node.display_all
    
    assert_equal expected, actual
  end
  
  def test_display_works_with_words
    args = {:node_value => "middle"}
    word_node = Node.new(args)
    word_node.set_new_node("earlier")
    word_node.set_new_node("before")
    word_node.set_new_node("silly")
    word_node.set_new_node("running")
    
    expected =
      "                middle                
              earlier        silly        
          before         running         
      "
    actual = word_node.display_all
    
    assert_equal expected, actual
  end
  
  def test_it_puts_node_values_in_asending_order
    node.set_new_node(17)
    node.set_new_node(22)
    node.set_new_node(7)
    node.set_new_node(2)
    node.set_new_node(4)
    node.set_new_node(1)
    node.set_new_node(5)
    node.set_new_node(15)
    node.set_new_node(9)
    
    expected = 
"1
2
3
4
5
6
7
9
12
15
17
22
"
    actual = node.find_ascending_order
    
    assert_equal expected, actual
  end

  
end

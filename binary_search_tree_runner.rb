require './search_tree'

file = ARGV[0]
input = File.readline(file)
tree = SearchTree.new
until input == nil
  tree.set_node(input)
  input = File.readline(file)
end

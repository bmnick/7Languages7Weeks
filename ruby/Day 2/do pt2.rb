class Tree
  attr_accessor :children, :node_name
  
  def initialize(subtree, name=nil)
    if name.nil?
      subtree.each do |k,v|
        @node_name = k
        @children = v.map {|k,v| Tree.new(v,k)}
      end
    else
      @node_name = name
      @children = subtree.map {|k,v| Tree.new(v,k)}
    end
  end
  
  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end
  
  def visit
    yield self
  end
end

t = Tree.new({'grandpa' => { 'dad' => { 'child 1' => {}, 'child 2' => {} }, 'uncle' => {'child 3' => {}, 'child 4' => {} } } })
t.visit_all {|n| puts n.node_name}

class PolyTreeNode

  attr_accessor :parent
  attr_reader :children, :value

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent
    @parent
  end

  def children
    self.children
  end

  def value
    self.value
  end

  def parent=
    unless @parent == nil

    end

  end

end

class Stack
  def initialize
    @stack = []
  end

  def add(el) #returns entire array (self)
    @stack.push(el)
  end

  def remove #returns value removed
    @stack.pop
  end

  def show
    @stack
  end
end

require 'byebug'
require_relative 'dfs.rb'
require_relative 'bfs.rb'

class PolyTreeNode

  attr_accessor :parent, :value, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
    @stack = Stack.new
    @queue = Queue.new
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def value
    @value
  end

  def parent=(parent_node)
    # byebug
    if parent_node
      if @parent
        @parent.children.delete(self) if @parent.children.include? self
      end

      @parent = parent_node
      @parent.children << self unless @parent.children.include? self
    else
      if @parent
        @parent.children.delete(self) if @parent.children.include? self
      end

      @parent = parent_node
    end
  end

  def add_child(child_node)
    #  byebug
    unless @children.include?(child_node)
      @children << child_node
      child_node.parent = self
      # byebug
    end
  end

  def remove_child(child_node = nil)
    raise "error" unless @children.include? child_node
    @children.delete(child_node).parent = nil
  end

  def dfs(target_value = nil)
    return self if self.value == target_value

    @children.each do |child|
      current_result = child.dfs(target_value)
      return current_result if current_result
    end

    nil
  end

  def bfs(target_value = nil)
    @queue.enqueue(self)

    until @queue.show.empty?
      current_node = @queue.dequeue
      return current_node if current_node.value == target_value

      current_node.children.each do |child|
        @queue.enqueue(child)
      end
    end

    nil
  end

end

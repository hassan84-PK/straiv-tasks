class Item
  attr_accessor :id, :name, :position

  def initialize(id, name, position)
    @id = id
    @name = name
    @position = position
  end
end

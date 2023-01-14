# frozen_string_literal: true

class Item
  attr_accessor :name, :id, :created_at

  def initialize(id, name, created_at)
    @id = id
    @name = name
    @created_at = created_at
  end
end

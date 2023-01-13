require './models/item'

class Navigation
  attr_reader :entries

  def initialize
    @entries = []
  end

  def add_item(id, name)
    entries << Item.new(id, name, entries.length + 1)
  end

  def destroy_item(name)
    index = entries.find_index{|item| item.name == name}
    return if index.nil?

    entries.delete_at(index)
    entries[index..entries.length].each{|item| item.position -= 1 }
  end

  def show_info
    entries.each do |item|
      puts "ID: #{item.id}".ljust(9) + "Name: #{item.name}".ljust(27) + "Position: #{item.position}"
    end
  end
end

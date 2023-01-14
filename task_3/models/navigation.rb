# frozen_string_literal: true

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
    index = entries.find_index { |item| item.name == name }
    return if index.nil?

    entries.delete_at(index)
    update_positions_after_deletion(index)
  end

  def show_info
    entries.each { |item| puts format_entry(item) }
  end

  private

  def format_entry(item)
    "ID: #{item.id}\tName: #{item.name}\tPosition: #{item.position}"
  end

  def update_positions_after_deletion(deleted_index)
    entries[deleted_index..entries.length].each { |item| item.position -= 1 }
  end
end

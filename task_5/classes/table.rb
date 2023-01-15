# frozen_string_literal: true

require './classes/item'

class Table
  attr_accessor :data

  def initialize
    @data = []
  end

  def add_data(id, name)
    data << Item.new(id, name, Time.now.utc.strftime('%Y-%m-%d %H:%M:%S'))
  end

  def print_table
    data.each { |value| puts "ID: #{value.id}\tName: #{value.name}\tcreated_at: #{value.created_at}" }
  end

  def remove_duplicates
    if duplicates?
      uniq_items = []
      data_group.each_value { |group| uniq_items << group.max_by(&:created_at) }
      @data.select! { |d| uniq_items.include? d }

      puts 'Duplicates removed'
    else
      puts 'No duplicates in Table'
    end
  end

  def duplicates?
    data_group.select { |_, v| v.count > 1 }.any?
  end

  def data_group
    @data_group ||= data.group_by(&:name)
  end
end

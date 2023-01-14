# frozen_string_literal: true

require './classes/table'

table = Table.new

# apply method to add data
table.add_data(1, 'Muhammad')
table.add_data(2, 'Hassan')
table.add_data(3, 'John')
table.add_data(4, 'Adam')
table.add_data(5, 'Jose')
table.add_data(6, 'Javier')
table.print_table
sleep(2.5)
# Adding duplicate value so time stamp will be different
table.add_data(7, 'Jose')
table.add_data(8, 'Hassan')
table.remove_duplicates
table.print_table

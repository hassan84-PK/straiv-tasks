# frozen_string_literal: true

require './models/navigation'

nav = Navigation.new
nav.add_item(1, 'Weather')
nav.add_item(13, 'Portfolio')
nav.add_item(29, 'Points of interest')
nav.add_item(4, 'Events')
nav.add_item(7, 'News')
nav.add_item(9, 'Check-in')
nav.show_info

nav.destroy_item('Events')
puts 'Deleted Events from list'
nav.show_info

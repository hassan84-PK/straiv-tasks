# frozen_string_literal: true

# using callbacks here
# Create Item model in any rails project
# then use rails console to set it up.

## Example model
class Navigation < ApplicationRecord
  before_create :save_position
  after_destroy :reset_positions

  private

  def save_position
    self.position = Navigation.last ? (Navigation.last.position + 1) : 1
  end

  def reset_positions
    Navigation.where(ActiveRecord::Base.sanitize_sql_array(['position > :position', { position: position }]))
              .update_all('position = position - 1')
  end
end

Navigation.create(name: 'Weather')
Navigation.create(name:  'Portfolio')
Navigation.create(name:  'Points of interest')
Navigation.create(name: 'Events')
Navigation.create(name: 'News')
Navigation.create(name: 'Check-in')

Navigation.third.destroy

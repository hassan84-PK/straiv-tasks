# frozen_string_literal: true

class Model < ApplicationRecord
  def self.remove_duplicates
    Model.group(:name).having('count(name) > 1').each do |duplicate|
      latest_record = Model.where(name: duplicate.name).order(created_at: :desc).first
      Model.where(name: duplicate.name).where.not(id: latest_record.id).destroy_all
    end
  end
end

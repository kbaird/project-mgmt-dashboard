# frozen_string_literal: true

# Allow UUIDs for IDs
class EnableUuid < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto'
  end
end

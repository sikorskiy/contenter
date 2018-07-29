class AddColumnsToCamp < ActiveRecord::Migration[5.2]
  def change
    add_column :camps, :preview, :text
    add_column :camps, :program, :text
    add_column :camps, :study, :text
    add_column :camps, :accommodation, :text
    add_column :camps, :meal, :text
    add_column :camps, :security, :text
    add_column :camps, :pricing, :text
    add_column :camps, :adds, :text
    add_column :camps, :latitude, :string
    add_column :camps, :longitude, :string
    add_column :camps, :starting_age, :integer
    add_column :camps, :finish_age, :integer
    add_column :camps, :foundation_year, :integer
    add_column :camps, :kids_in_camp, :integer
    add_column :camps, :kids_in_group, :integer
    add_column :camps, :leaders_per_group, :integer
    add_column :camps, :promo_day, :boolean
    add_column :camps, :photos, :integer
    add_column :camps, :video_links, :text
    add_column :camps, :comment, :text
  end
end

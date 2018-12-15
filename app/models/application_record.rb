class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.as_csv
    CSV.generate do |csv|
      columns = self.attribute_names
      csv << columns.map(&:humanize)
      self.find_each do |c|
        csv << c.attributes.values_at(*columns)
      end
    end
  end
end

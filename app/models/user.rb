require 'csv'
class User < ApplicationRecord

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      next if row.to_hash.values.any? { |value| value.nil? || value.empty? }

      User.create!(row.to_hash)
    end
  end


  def self.to_csv
    attributes = %w[id name steps pushups situps pullups created_at updated_at]
    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |user|
        csv << attributes.map { |attr| user.send(attr) }
      end
    end
  end
end

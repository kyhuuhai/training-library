class Author < ActiveRecord::Base
  has_many :books, dependent: :destroy, foreign_key: :authors_id
  scope :order_name, -> { order(name: :ASC)}
  scope :search_name, ->(name) { where("LOWER(name) LIKE ?", "%#{name}%") if name.present? }
  scope :search, lambda { |params|
    search_name(params[:name])
  }
  def self.to_xls(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |student|
        csv << student.attributes.values_at(*column_names)
      end
    end
  end
end

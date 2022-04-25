class Publisher < ActiveRecord::Base
  CSV_ATTRIBUTES = %w(name).freeze
  has_many :books, dependent: :destroy
  validates :name, presence: true
  attr_accessor :books
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

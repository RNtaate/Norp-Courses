class Course < ApplicationRecord
  validates :title, :short_description, :language, :level, :price, presence: true
  validates :description, presence: true, length: {minimum: 5}

  has_rich_text :description

  belongs_to :user

  extend FriendlyId
  friendly_id :title, use: :slugged

  LANGUAGES = [:"English", :"Spanish", :"French", :"Russian"]
  def self.languages
    LANGUAGES.map{|language| [language, language]}
  end
end

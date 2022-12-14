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

  LEVELS = [:"Beginner", :"Intermediate", :"Advanced"]
  def self.levels
    LEVELS.map{|level| [level, level]}
  end

  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user}
end

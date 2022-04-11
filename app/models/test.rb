# frozen_string_literal: true

class Test < ApplicationRecord
  INFINITY = Float::INFINITY
  MINIMAL_VALUE = 0

  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :results, dependent: :delete_all
  has_many :users, through: :results
  has_many :questions, dependent: :destroy

  scope :simple_level, -> { where(level: 0..1) }
  scope :intermediate_level, -> { where(level: 2..4) }
  scope :difficult_level, -> { where(level: 5..INFINITY) }

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: MINIMAL_VALUE }

  class << self
    def test_names_in_descending_order(category_name)
      joins(:category)
        .where(categories: { title: category_name })
        .order(title: :desc)
        .pluck(:title)
    end
  end
end

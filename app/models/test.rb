class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user, foreign_key: "author_id"
  has_many :results
  has_many :users, through: :results
  has_many :questions

  class << self
    def test_names_in_descending_order(category_name)
      joins("INNER JOIN categories ON categories.id = tests.category_id")
        .where(categories: { title: category_name })
        .order(title: :desc)
        .pluck(:title)
    end
  end
end

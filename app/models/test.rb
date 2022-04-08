class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: "author_id"

  has_many :results, dependent: :nullify
  has_many :users, through: :results
  has_many :questions, dependent: :destroy

  class << self
    def test_names_in_descending_order(category_name)
      joins(:category)
        .where(categories: { title: category_name })
        .order(title: :desc)
        .pluck(:title)
    end
  end
end

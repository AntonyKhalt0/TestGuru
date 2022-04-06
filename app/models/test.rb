class Test < ApplicationRecord
  class << self
    def test_names_in_descending_order(category_name)
      joins("INNER JOIN categories ON categories.id = tests.category_id")
        .where(categories: { title: category_name })
        .order(title: :desc)
        .pluck(:title)
    end
  end
end

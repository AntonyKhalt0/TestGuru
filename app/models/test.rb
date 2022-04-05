class Test < ApplicationRecord
  class << self
    def test_names_in_descending_order(category)
      Test.joins("INNER JOIN categories ON categories.id = tests.category_id").where(categories: { title: category }).
                                                                              order(title: :desc).pluck(:title)
    end
  end
end

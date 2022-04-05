class Test < ApplicationRecord
  class << self
    def test_names_in_descending_order(source_category)
      category_id = Category.where(title: source_category).id
      Test.where("category_id = ?", category_id).order(title: :desc).pluck(:title)
    end
  end
end

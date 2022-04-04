class Test < ApplicationRecord
  class << self
    def test_names_in_descending_order(source_category)
      category_id = Category.find_by(title: source_category).id
      titles = []
      Test.where("category_id = ?", category_id).order(title: :desc).
                                                each { |test| titles.push(test.title) }
      titles
    end
  end
end

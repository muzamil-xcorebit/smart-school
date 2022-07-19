class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

    def grade
      grade = [["KG","kg"],["Nursery", "nursery"],["Prep", "prep"], ["One", "one"],["two", "two"],["Three", "three"],["Four", "four"],["Five", "five"]]
    end

 end

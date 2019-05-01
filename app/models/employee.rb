class Employee < ApplicationRecord
    belongs_to :dog


    def to_s
        puts self.first_name + " " + self.last_name
    end
end

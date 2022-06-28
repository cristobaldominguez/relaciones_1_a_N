class Building < ApplicationRecord
    has_many :apartments

    def to_s
        self.name
    end
end
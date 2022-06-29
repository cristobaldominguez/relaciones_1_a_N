class Building < ApplicationRecord
    has_many :apartments, dependent: :destroy
end

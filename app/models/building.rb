class Building < ApplicationRecord
    has_many :apartments, dependent: :destroy
    accepts_nested_attributes_for :apartments,
                                  allow_destroy: true,
                                  reject_if: proc { |attributes| attributes[:number].blank? }
end

class Record < ApplicationRecord
  belongs_to :user, dependent: :destroy
end

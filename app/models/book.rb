class Book < ApplicationRecord
  # N:1の関係
  belongs_to :user
end

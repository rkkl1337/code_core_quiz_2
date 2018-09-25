# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :idea
  belongs_to :user
  
  validates(:title, presence: true, uniqueness: true)

  validates(:body, presence: true)
end

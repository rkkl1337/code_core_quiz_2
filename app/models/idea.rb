# frozen_string_literal: true

class Idea < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates(:title, presence: true, uniqueness: true)

  validates(:body, presence: true)
end

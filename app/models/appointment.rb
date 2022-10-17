# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :doctor

  enum :status, { active: 0, closed: 1 }

  validates :body, presence: { on: :update }
end

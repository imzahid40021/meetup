# frozen_string_literal: true

FactoryBot.define do
  factory :user_group do
    role
    user
    group
  end
end

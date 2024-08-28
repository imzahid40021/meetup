# frozen_string_literal: true

FactoryBot.define do
  factory :group do
    name { Faker::Name.unique.name }
  end
end

# frozen_string_literal: true

FactoryBot.define do
  factory :label_1, class: Label do
    name { 'プライベート' }
  end

  factory :label_2, class: Label do
    name { '仕事' }
  end

  factory :label_3, class: Label do
    name { '買い物' }
  end
  factory :label_4, class: Label do
    name { '勉強' }
  end
  factory :label_5, class: Label do
    name { '雑事' }
  end
  factory :label_6, class: Label do
    name { '遊び' }
  end
end

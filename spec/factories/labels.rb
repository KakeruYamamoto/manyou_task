FactoryBot.define do

  factory :label_one ,class: Label do
    name { "ラベル１" }
  end

  factory :label_two ,class: Label do
    name { "ラベル２" }
  end

  factory :label_tree ,class: Label do
    name { "ラベル3" }
  end
end

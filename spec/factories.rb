FactoryGirl.define do
  factory :sub_type_NFR, class: SubType do
    name 'NFR 123'
  end

  factory :subject_req1, class: Subject do
    name 'subject 1'
    association :sub_type, factory: :sub_type_NFR
  end
end


FactoryBot.define do
  factory :message do
    text {"hello"}
    integer {1}
    user
  end
end
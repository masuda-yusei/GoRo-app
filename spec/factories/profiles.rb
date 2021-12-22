FactoryBot.define do
  factory :profile do
    gender { "男性" }
    birthday { "1994-09-02-02" }
  end

  factory :second_profile, class: Profile do
    gender { "女性" }
    birthday { "1995-08-02" }
  end
end
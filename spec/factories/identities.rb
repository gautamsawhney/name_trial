FactoryGirl.define do
  factory :identity do
    account nil
    provider "MyString"
    accesstoken "MyString"
    refreshtoken "MyString"
    uid "MyString"
  end
end

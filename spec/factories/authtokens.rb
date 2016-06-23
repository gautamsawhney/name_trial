FactoryGirl.define do
  factory :authtoken do
    token "MyString"
    last_used_at "2016-06-23 11:39:52"
    sign_in_ip ""
    user_agent "MyString"
    device_id "MyString"
    account nil
  end
end

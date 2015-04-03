FactoryGirl.define do  factory :view do
    
  end
  factory :user do
    email "tester@test.com"
    password "12345678"
  end

  factory(:post) do
    title('A new blog post')
    content('some stuff about my day')
    date('yesterday in march')
  end
end
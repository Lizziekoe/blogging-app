FactoryGirl.define do  factory :view do
    
  end
  factory :user do
    
  end

  factory(:post) do
    title('A new blog post')
    content('some stuff about my day')
    date('yesterday in march')
  end
end
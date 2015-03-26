FactoryGirl.define do
  factory(:post) do
    title('A new blog post')
    content('come stuff about my day')
    date('yesterday in march')
  end
end
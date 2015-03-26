FactoryGirl.define do
  factory(:post) do
    title('A new blog post')
    content('some stuff about my day')
    date('yesterday in march')
  end
end
RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods # 在測試裡不需要使用 FactoryGirl
end

require_relative 'basic'
module Page
  class Template < Basic::Methods
    include Capybara::DSL

    def initialize
      url = '/'
      visit(url)
      validate!
    end

    private

    def validate!
      assert_selector('form#test')
    end
  end
end

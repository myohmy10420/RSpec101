require_relative "../base"

module PageObjects
  module Pages
    class Home < Base
      def go
        visit root_url
      end

      def add_course
        click_link "New course"
        PageObjects::Courses::Form.new
      end
    end
  end
end

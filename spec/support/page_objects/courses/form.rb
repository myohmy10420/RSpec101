require_relative "../base"

module PageObjects
  module Courses
    class Form < Base
      def create(title, description)
        fill_form :course, :new, title: title
        find('[name="course[description]"]', visible: false).set description
        click_on "Submit"
      end
    end
  end
end

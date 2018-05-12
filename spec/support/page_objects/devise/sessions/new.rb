require_relative "../../base"

module PageObjects
  module Devise
    module Sessions
      class New < Base

        def sign_in(email, password)
          fill_form :user, email: email, password: password
          click_button "Log in"
        end

        def sign_out(email)
          user_dropdown(email).click_on "Logout"
        end

        def user_dropdown(email)
          dropdown email
        end

        private

        def dropdown(text)
          find ".navbar .dropdown", text: text
        end

      end
    end
  end
end

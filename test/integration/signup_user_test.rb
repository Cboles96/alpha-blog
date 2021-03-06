require 'test_helper'

class SignupUserTest < ActionDispatch::IntegrationTest
    test "get signup form and create user" do
        get "/signup"
        assert_response :success

        assert_difference "User.count", 1 do
            post users_path, params: { user: { username: "test", email: "test@example.com",
                password: "password", admin: false} }
                assert_response :redirect
            end
            follow_redirect!
            assert_response :success
    end
end
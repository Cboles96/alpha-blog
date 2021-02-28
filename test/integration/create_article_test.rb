class CreateArticleTest < ActionDispatch::IntegrationTest
    setup do
        @user = User.create(username: "test", email: "test@example.com",
                                  password: "password", admin: false)
        sign_in_as(@user)
    end

    test "get create article form and create article" do
        get '/articles/new'
        assert_response :success

        assert_difference "Article.count", 1 do
            post articles_path, params: { article: { title: "Testing Article", description: "This is a test article.", category: "Travel" } }
            assert_response :redirect
        end
        follow_redirect!
        assert_response :success
    end

    # test "get signup form and create user" do
    #     get "/signup"
    #     assert_response :success

    #     assert_difference "User.count", 1 do
    #         post users_path, params: { user: { username: "test", email: "test@example.com",
    #             password: "password", admin: false} }
    #             assert_response :redirect
    #         end
    #         follow_redirect!
    #         assert_response :success
    # end
end
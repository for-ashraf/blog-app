RSpec.describe "Users", type: :request do
    describe "request list of all users" do
      user = User.create(name: “Test user”)
      get users_path
      expect(response).to be_successful
      expect(response.body).to include(“Test user”)
    end
  end
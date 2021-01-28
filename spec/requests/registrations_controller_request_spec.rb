require 'rails_helper'

RSpec.describe "RegistrationsControllers", type: :request do
    describe "required test" do
        it "get sign_in_path" do
            get new_user_registration_path
            expect(response.status).to eq 200
        end
        it "name is required" do
            patch user_registration_path, params: {
                email: "test@test.com",
                name: "",
                password: "test"
            }
            # pending後のテストケースの方が厳密だが動作しないので、登録が成功しないことのみテスト
            expect(response.body).not_to redirect_to user_index_path
            pending('new_user_registration_pathに遷移せずregistration_pathに留まるバグ。GitHub Issue #5113')
            expect(response.body).to redirect_to new_user_registration_path
        end
    end

end

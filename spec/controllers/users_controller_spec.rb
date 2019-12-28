require 'rails_helper'

describe UsersController, type: :controller do
  describe "#show" do
    before do
      @user = FactoryBot.create(:user)
      @message = @user.messages.create(
        good: 'ほげ',
        bad: 'ほげ',
        improvement: 'ほげ',
        month_id: 1,
        day_id: 1,
        user_id: 1
      )
    end

    it "responds successfully" do
      sign_in @user
      get :show, params: {id: @user.id}
      expect(response).to be_success
    end
  end
end
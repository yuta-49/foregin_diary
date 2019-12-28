require 'rails_helper'

describe MessagesController, type: :controller do
  describe "#index" do
  # 正常なレスポンスか？
    it "responds successfully" do
      get :index
      expect(response).to be_success
    end
    
    it "renders the :create template" do
      post :create
      expect(response).to redirect_to root_path
    end
  end

  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to redirect_to root_path
    end

    it "request must be 200 OK" do
      get :new
      expect(response.status).to eq 302
    end
  end

  describe 'Delete #destroy' do
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

    context "for existing users" do
      it "request should be a 302 redirect" do
        delete :destroy, params: {id: @message.user.id}
        expect(response.status).to eq 302
      end

      # it "renders the :new template" do
      #   delefte :destroy, params: {id: @message.user.id}
      #   expect(response).to redirect_to :new
      # end
    end
    context "how to delete a message" do

      it "deletes the message" do
        delete :destroy, params: {id: @message.user.id}
        expect{ response }.to change(Message,:count).by(-1)
      end
    end
  end
end
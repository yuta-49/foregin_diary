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
end
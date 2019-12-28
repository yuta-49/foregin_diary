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
end
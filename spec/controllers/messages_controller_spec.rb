require 'rails_helper'

describe MessagesController, type: :controller do
  describe '#index' do
    it "responds successfully" do
      get :index
      expect(response).to be_success
    end
  end
end
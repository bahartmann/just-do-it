require 'rails_helper'

RSpec.describe TasksController, type: :controller do

  let(:user) { FactoryBot.create :user }
  let(:task) { FactoryBot.create :task, user_id: user.id }

  describe 'GET index' do

    before(:each) do
      sign_in user
    end

    it 'should render index' do
      get :index
      expect(assigns(:tasks)).to eq([task])
    end
  end
end

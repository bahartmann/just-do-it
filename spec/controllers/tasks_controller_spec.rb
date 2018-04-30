require 'rails_helper'

RSpec.describe TasksController, type: :controller do

  let(:user) { FactoryBot.create :user }
  let(:task) { FactoryBot.create :task, user_id: user.id }

  before(:each) do
    sign_in user
  end

  describe 'GET index' do
    it 'should assign tasks' do
      get :index
      expect(assigns(:tasks)).to eq([task])
    end

    it 'should render index' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET new' do
    it 'should render new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end
end

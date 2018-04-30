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

  describe 'POST new' do
    let(:task_params) { { task: FactoryBot.attributes_for(:task) } }
    it 'should create new task' do
      expect{
        post :create, params: task_params
      }.to change(Task, :count).by(1)
    end

    it 'should resdirect to index' do
      post :create, params: task_params
      expect(response).to redirect_to(tasks_url)
    end
  end
end

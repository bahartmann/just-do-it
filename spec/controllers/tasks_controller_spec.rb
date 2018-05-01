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

  describe 'POST create' do
    let(:task_params) { { task: FactoryBot.attributes_for(:task) } }

    it 'should create new task' do
      expect{
        post :create, params: task_params
      }.to change(Task, :count).by(1)
    end

    it 'should redirect to index' do
      post :create, params: task_params
      expect(response).to redirect_to(tasks_url)
    end
  end

  describe 'GET edit' do
    it 'should render edit template' do
      get :edit, params: { id: task.id }
      expect(response).to render_template(:edit)
    end
  end

  describe 'PUT update' do
    let(:undone_task) { FactoryBot.create :task, done: false, user_id: user.id }

    it 'should update existent task' do
      put :update, params: {
          id: undone_task.id, task: { done: true }
      }
      undone_task.reload
      expect(undone_task.done).to be true
    end

    it 'should redirect to index' do
      put :update, params: {
          id: undone_task.id, task: { done: true }
      }
      expect(response).to redirect_to(tasks_url)
    end
  end

  describe 'DELETE destroy' do
    it 'destroy task' do
      task = FactoryBot.create :task, user_id: user.id
      expect{
        delete :destroy, params: { id: task.id }
      }.to change(Task, :count).by(-1)
    end

    it 'should redirect to index' do
      task = FactoryBot.create :task, user_id: user.id
      delete :destroy, params: { id: task.id }
      expect(response).to redirect_to(tasks_url)
    end
  end
end

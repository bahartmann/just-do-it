require 'rails_helper'

RSpec.describe TasksController, type: :controller do

  let(:user) { FactoryBot.create :user }
  let(:task) { FactoryBot.create :task, user_id: user.id }

  before(:each) do
    sign_in user
  end

  describe 'GET index' do

    it 'assigns tasks from user' do
      other_user = FactoryBot.create :user
      other_user_task = FactoryBot.create :task, user_id: other_user.id

      get :index
      expect(assigns(:tasks)).to eq([task])
    end

    it 'renders index' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET new' do
    it 'renders new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST create' do
    let(:task_params) { { task: FactoryBot.attributes_for(:task) } }

    it 'creates new task' do
      expect{
        post :create, params: task_params
      }.to change(Task, :count).by(1)
    end

    it 'redirects to index' do
      post :create, params: task_params
      expect(response).to redirect_to(tasks_url)
    end
  end

  describe 'GET edit' do
    it 'renders edit template' do
      get :edit, params: { id: task.id }
      expect(response).to render_template(:edit)
    end
  end

  describe 'PUT update' do
    let(:some_task) { FactoryBot.create :task, description: "Eat", user_id: user.id }

    it 'updates task attributes' do
      put :update, params: {
          id: some_task.id, task: { description: "Drink" }
      }
      some_task.reload
      expect(some_task.description).to eq("Drink")
    end

    it 'redirects to index' do
      put :update, params: {
          id: some_task.id, task: { description: "Drink" }
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

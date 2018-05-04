class TasksController < ApplicationController
  include UserMailerHelper
  before_action :set_task, only: [:edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.where(user_id: current_user.id).order(:done)
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id

    respond_to do |format|
      if @task.save
        flash[:notice] = 'Task was successfully created.'
        format.html { redirect_to tasks_url }
        format.json { render :index, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    marked_as_done = done_changed_to_true
    respond_to do |format|
      if @task.update(task_params)
        notify_task_done if marked_as_done
        flash[:notice] = 'Task was successfully updated.'
        format.html { redirect_to tasks_url }
        format.json { render :index, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      flash[:notice] = 'Task was successfully destroyed.'
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:description, :done)
    end

    def notify_task_done
      text = random_congrats_message
      color = random_color

      UserMailer.with(user: current_user).task_done_email(text, color).deliver_now
      Event.new(
        user_id: current_user.id,
        event_type: "task_done",
        payload: { message_text: text, message_color: color}
      ).save
    end

    def done_changed_to_true
      was_undone = !@task.done
      is_done = (params[:task][:done])
      was_undone && is_done
    end
end

class PsychologyTasksController < ApplicationController
  before_action :set_psychology_task, only: [:show, :edit, :update, :destroy]

  # GET /psychology_tasks
  def index
    if params[:client_id]
      @pagy, @psychology_tasks = pagy(User.find(params[:client_id]).psychology_tasks)
    else
      @pagy, @psychology_tasks = pagy(User.find(params[:user_id]).psychology_tasks)
      respond_to do |format|
        format.html
        format.pdf do
          render pdf: "Psychology_Exercises_History_#{Date.today.strftime("%Y_%m_%d")}",
          page_size: 'A4',
          template: "psychology_tasks/index.pdf.erb",
          title: "Psychology_Exercises_History_#{Date.today.strftime("%Y_%m_%d")}",
          locals: { :psychology_tasks => params[:psychology_task].nil? ? @psychology_tasks : psychology_tasks_in_date_range }
        end
      end
    end
  end

  # GET /psychology_tasks/1
  def show
  end

  # GET /psychology_tasks/new
  def new
    # @psychology_task = PsychologyTask.new
    @psychology_task = User.find(params[:user_id]).psychology_tasks.new
    # if params[:client_id]
    #   @psychology_task = User.find(params[:client_id]).psychology_tasks.new
    # else
    #   @psychology_task = User.find(parmas[:client_id]).psychology_tasks.new
    # end
  end

  # GET /psychology_tasks/1/edit
  def edit
  end

  # POST /psychology_tasks
  def create
    # if id's are different, routine is being created by a professional for one of his clients
    if params[:psychology_task][:user_id].to_i != current_user.id
      @client = User.find(params[:psychology_task][:user_id].to_i)
      @psychology_task = @client.psychology_tasks.new(psychology_task_params)
      if @psychology_task.valid?
        @psychology_task.save
        redirect_to user_clients_path(user_id: params[:user_id]),
          notice: 'Psychology exercise created for your client successfully'
      else
        render :new
      end
    else
      @user = current_user
      @psychology_task = @user.psychology_tasks.new(psychology_task_params)
      if @psychology_task.valid?
        @psychology_task.save
        redirect_to user_psychology_tasks_path(@user), notice: 'Psychology exercise created successfully'
      else
        render :new
      end
    end
  end

  # PATCH/PUT /psychology_tasks/1
  def update
    if @psychology_task.update(psychology_task_params)
      if params[:psychology_task][:user_id].to_i != current_user.id
        redirect_to user_psychology_tasks_path(current_user),
          notice: "Psychology exercise updated for client successfully"
      else
        redirect_to user_psychology_tasks_path(current_user), notice: 'Psychology exercise updated successfully'
      end
    else
      render :edit
    end
  end

  # DELETE /psychology_tasks/1
  def destroy
    if @psychology_task.destroy
      redirect_to user_psychology_tasks_path(current_user), notice: 'Psychology exercise deleted successfully'
    else
      flash[:error] = @psychology_task.errors.full_messages
    end
  end

  def delete_all
    if current_user.psychology_tasks.delete_all
      redirect_to user_psychology_tasks_path(current_user), notice: 'All psychology tasks deleted successfully'
    else
      redirect_to user_psychology_tasks_path(current_user), flash[:error] = 'Something went wrong while deleting all psychology tasks'
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def psychology_task_params
    params.require(:psychology_task).permit(
      :name,
      :description,
      :user_id,
      :client_id
    )
  end
  
  # Use callbacks to share common setup or constraints between actions.
  def set_psychology_task
    @psychology_task = PsychologyTask.find(params[:id])
  end

  def psychology_tasks_in_date_range
    start_date = params[:psychology_task][:start_date]
    end_date = params[:psychology_task][:end_date]
    # if start_date or end_date are empty (or both), return all meals
    # need to check why if in a single line doesn't work
    if start_date.empty?
      psychology_tasks = current_user.psychology_tasks
      return psychology_tasks
    elsif end_date.empty?
      psychology_tasks = current_user.psychology_tasks
      return psychology_tasks
    end
    psychology_tasks_in_range = []
    @psychology_tasks.each do |psychology_task|
      psychology_task_date = psychology_task.created_at.strftime("%Y-%m-%d")
      if psychology_task_date.between?(start_date, end_date)
        psychology_tasks_in_range << psychology_task
      end
    end
    psychology_tasks_in_range
  end

end

class Api::V1::TodosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_todo, only: [:show, :update, :destroy]
  
  def index
  	@todos = current_user.todos
  	render json: @todos
  end

  def show
    # @todo = current_user.todos.find(params[:id])
  	render json: @todo
  end

  def create
  	@todo = current_user.todos.new(valid_params)
  	if @todo.save
  	  render json: @todo, status: 200
  	else
  	  render json: @todo.errors, status: :unprocessable_entity
  	end
  end

  def update
    # @todo = current_user.todos.find(params[:id])
  	if @todo.update(valid_params)
  	  render json: {message: "todo updated"}, status: 200
  	else
  	  render json: {message: "unable to update todo!"}, status: 500
  	end
  end

  def destroy
    # @todo = current_user.todos.find(params[:id])
  	if @todo
  	  @todo.destroy
  	  render json: { message: "todo deleted!" }, status: 200
  	else
  	  render json: { message: "unable to deleted todo!" }, status: 500
  	end
  end

  private

  def set_todo
  	@todo = current_user.todos.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "unable to find todo"}
  end

  def valid_params
  	params.require(:todo).permit(:title)
  end

end

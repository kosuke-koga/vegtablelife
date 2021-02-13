# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    @task = Task.new
    @cards = Task.includes(:user).where(user_id: current_user.id)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(tasks_params)
    @task.save
    redirect_back fallback_location: @task_url
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.new(tasks_params)
    @task.save
    redirect_back fallback_location: @task_url
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_back fallback_location: @task_url
  end

  private

  def tasks_params
    params.permit(:list, :card, :date).merge(user_id: current_user.id)
  end
end

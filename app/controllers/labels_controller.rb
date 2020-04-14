# frozen_string_literal: true

class LabelsController < ApplicationController
  before_action :set_label, only: %i[show edit update destroy]

  def index
    @labels = Label.all
  end

  def show; end

  def new
    @label = Label.new
  end

  def edit; end

  def create
    @label = Label.new(label_params)
    if @label.save
      redirect_to @label, notice: 'Label was successfully created.'
    else
      render :new
    end
  end

  def update
    if @label.update(label_params)
      redirect_to @label, notice: 'Label was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @label.destroy
    redirect_to labels_url, notice: 'Label was successfully destroyed.'
  end

  private

  def set_label
    @label = Label.find(params[:id])
  end

  def label_params
    params.require(:label).permit(:name)
  end
end

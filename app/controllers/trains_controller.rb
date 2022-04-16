class TrainsController < ApplicationController
  before_action :set_train, only: %i[ show edit update destroy ]

  def index
    @trains = Train.all
  end

  def show
  end

  def new
    @train = Train.new
  end

  def create
    @train = Train.new(train_params)

    respond_to do |format|
      if @train.save
        format.html { redirect_to train_url(@train), notice: "Поезд успешно создан." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @train.update(train_params)
        format.html { redirect_to train_url(@train), notice: "Поезд успешно изменен." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @train.destroy

    respond_to do |format|
      format.html { redirect_to trains_url, notice: "Поезд успешно удален." }
    end
  end
  
  private

  def set_train
    @train = Train.find(params[:id])
  end

  def train_params
    params.require(:train).permit(:name)
  end
end
class RecordsController < ApplicationController

  def index
    @records = Order.new
  end

  def create
    @record = Order.new(record_params)
    if @record.valid?
      @record.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def record_params
    params.require(:record).permit()
  end
end

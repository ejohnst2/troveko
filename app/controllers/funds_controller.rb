class FundsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new, :edit]
  before_action :set_fund, only: [:show, :edit, :update, :destroy]

  def index
    Fund.all
  end

  def edit
  end

  def update
    respond_to do |format|
      if @fund.update(fund_params)
        format.html { redirect_to @fund, notice: 'Fund has been updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def create
    @fund = Fund.new(fund_params)
    @fund.user = current_user

    if @fund.save
      redirect_to fund_path(@fund)
    else
      render 'new'
    end
  end

  def new
    @fund = Fund.new
  end

  def destroy
    @fund.destroy
    respond_to do |format|
      format.html { redirect_to funds_url, notice: 'Fund was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show
    @fund = Fund.find(params[:id])
  end

  def fund_percentage
    raised = @experience.fund.contributions.sum(:amount_cents).to_f
    goal = @experience.fund.funding_goal_cents.to_f
    result = ((raised/goal)*100)
  end

  private

  def set_fund
    @fund = Fund.find(params[:id])
  end

  def fund_params
    params.require(:fund).permit(:amount_cents)
  end

end

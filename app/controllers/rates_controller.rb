class RatesController < ApplicationController
  def index
  end

  def show
  end
  
  def new
  end

  def edit
  end

  def create
    @rate=Rate.new(params[:rate])
    if(@rate.save)
    respond_to do |format|
      format.js{ 
        render :update do |page|
          page.hide 'new_rate_'+@rate.ratable_id.to_s
          page.replace_html 'rates_'+@rate.ratable_id.to_s,:partial=>'rates/rate',:locals=>{:ratable=>@rate.ratable}
        end
      }
    end
    else
    end
  end

  def update
  end

  def destroy
  end
end

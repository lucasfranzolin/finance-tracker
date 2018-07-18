class StocksController < ApplicationController
    def search
        if params[:stock].blank?
            flash.now[:danger] = "Search field can't be blank, try again."
        else
            @stock = Stock.new_from_lookup(params[:stock])
            flash.now[:danger] = "This symbol doesn't exist, try again." unless @stock
        end
        respond_to do |format|
            format.js { render partial: 'users/result' }
        end 
    end
end

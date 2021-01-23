class PortfoliosController < ApplicationController
    def index
        if (!params[:subtitle])
            @portfolio_items = Portfolio.all
        elsif params[:subtitle] == 'rails'
            @portfolio_items = Portfolio.ruby_on_rails_portfolio_items
        elsif params[:subtitle] == 'angular'
            @portfolio_items = Portfolio.angular
        end
    end

    def new
        @portfolio_item = Portfolio.new
    end

    def show
        @portfolio_item = Portfolio.find(params[:id])
    end

    def create
        @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :body, :subtitle))

        respond_to do |format| 
            if @portfolio_item.save
                format.html { redirect_to portfolios_path, notice: 'Your portfolio item has been added'}
            else
                format.html { render :new }
            end
        end
    end


    def edit
        @portfolio_item = Portfolio.find(params[:id])

    end

    def update
        @portfolio_item = Portfolio.find(params[:id])

        respond_to do |format|
          if @portfolio_item.update(params.require(:portfolio).permit(:title, :body))
            format.html { redirect_to portfolios_path, notice: 'Record was successfully updated.' }
            # format.json { render :show, status: :ok, location: @blog }
          else
            format.html { render :edit }
            # format.json { render json: @blog.errors, status: :unprocessable_entity }
          end
        end
    end


    def destroy
        # Lookup the item in question
        @portfolio_item = Portfolio.find(params[:id])

        # Destroy/delete the record
        @portfolio_item.destroy

        # Redirect post-destruction
        respond_to do |format|
            format.html { redirect_to portfolios_url, notice: 'Portfolio item was successfully destroyed.' }
        end
    end
end

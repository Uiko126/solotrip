class SendsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

    def spot
      if params[:search] != nil && params[:search] != ''
        #部分検索かつ複数検索
        search = params[:search]
        @spots = Send.joins(:user).where(category:"spot").where("title LIKE ? OR address LIKE ? OR detail LIKE ? ", "%#{search}%", "%#{search}%", "%#{search}%")
      else
        @spots = Send.where(category:"spot")
      end
    end
      
    def shop
      if params[:search] != nil && params[:search] != ''
        #部分検索かつ複数検索
        search = params[:search]
        @shops = Send.joins(:user).where(category:"shop").where("title LIKE ? OR address LIKE ? OR detail LIKE ? ", "%#{search}%", "%#{search}%", "%#{search}%")
      else
        @shops = Send.where(category:"shop")
      end
    end
      
    def accommodation
      if params[:search] != nil && params[:search] != ''
        #部分検索かつ複数検索
        search = params[:search]
        @accommodations = Send.joins(:user).where(category:"accommodation").where("title LIKE ? OR address LIKE ? OR detail LIKE ? ", "%#{search}%", "%#{search}%", "%#{search}%")
      else
        @accommodations = Send.where(category:"accommodation")
      end
    end
  
    def new
      @send = Send.new
    end
      
    def create
      send = Send.new(send_params)
      send.user_id = current_user.id

      if send.save
          redirect_to :action => "spot"
      else
          redirect_to :action => "new"
      end
    end
  
    def show
      @send = Send.find(params[:id])
    end

    def edit
      @send = Send.find(params[:id])
    end

    def update
      send = Send.find(params[:id])
      if send.update(send_params)
        redirect_to :action => "show", :id => send.id
      else
        redirect_to :action => "new"
      end
    end

    def destroy
      send = Send.find(params[:id])
      send.destroy
      redirect_to action: :spot
    end

  
    private
      def send_params
        params.require(:send).permit(:detail,:category,:title,:address,:access,:latitude,:longitude, :overall) 
      end
  
end

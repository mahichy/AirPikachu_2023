class RoomController < ApplicationController
  before_action :set_room, except: [ :index, :new, :create]
  before_action :authenticat_user!, except: [:show]
  def index
    @rooms = current_user.rooms
  end

  def new
    @room = current_user.rooms.build
  end

  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      redirect_to listing_room_path(@room), notice: "Saved....."
    else
      render :new, notice: "Sometihing went wrong..."
    end

  end

  def show
    
  end

  def listing
    # @room = Room.find(params[:id])
    # set_room
  end

  def pricing
    # @room = Room.find(params[:id])
    # set_room
  end

  def description
    # @room = Room.find(params[:id])
    # set_room
  end

  def photo_upload
  end

  def amenities
  end

  def location
  end

  def update
    if @room.update(room_params)
      flash[:notice] = "Saved..."
    else
      flash[:notice] = "Something went wrong...."
    end
    redirect_back(fallback_location: request.referer)
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:home_type, :room_type, :accommodate, :bed_room, :bath_room, :listing_name, :summary, :address, :is_tv, :is_internet, :is_kitchen, :is_air, :is_heating, :price, :active)
  end
end

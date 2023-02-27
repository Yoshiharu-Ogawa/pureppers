class Admin::AnnouncementsController < ApplicationController

  before_action :authenticate_admin!

  def index
    @announcements = Announcement.all
  end

  def new
    @announcement = Announcement.new
  end

  def create
    @announcement = Announcement.new(announcement_params)

    if @announcement.save
      redirect_to root_path
    end
  end

  def destroy
    announcement = Announcement.find(params[:id])
    announcement.destroy
    redirect_to root_path, notice: "お知らせを削除しました"
  end

  private

  def announcement_params
    params.require(:announcement).permit(:title, :content)
  end

end

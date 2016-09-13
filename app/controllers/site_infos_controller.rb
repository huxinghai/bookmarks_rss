class SiteInfosController < ApplicationController

  def destroy
    @site_info = SiteInfo.find(params[:id])
    site_info = current_user.site_infos_users.find_by(site_info: @site_info)
    site_info.destroy
    respond_to do |format|
      format.json{ head :no_content }
    end
  end

end
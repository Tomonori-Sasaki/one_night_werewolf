class RolesController < ApplicationController
  def index
    @roles = Role.all
  end

  def new
    @role = Role.new
  end

  def create
    role_num = Role.all.count + 1
    @role = Role.new(name: role_params[:name], examination: role_params[:examination], team: role_params[:team], role_num: role_num)

    if role_params[:image]
      @role.image = "#{role_num}.png"
      image = role_params[:image]
      File.binwrite("app/assets/images/#{@role.image}", image.read)
    end

    @role.save
    flash[:notice] = '新たな役職が登録されました'
    redirect_to(roles_path)
  end

  def destroy
    if Role.all[0]
      Role.last.destroy
      flash[:notice] = '1つの役職を闇に葬むりました'
    end
    redirect_to(roles_path)
  end

  def destroy_all
    if Role.all[0]
      Role.destroy_all
      flash[:notice] = '全ての役職を闇に葬りました'
    end
    redirect_to(roles_path)
  end

  private
    def role_params
      params.require(:role).permit(:name, :examination, :team, :image)
    end
end

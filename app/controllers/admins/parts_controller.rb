class Admins::PartsController < AdminsController
  before_action :set_part, only: [:edit, :update, :destroy]

  def index
    @objects = Part.all
  end

  def new
    @obj = Part.new
  end

  def create
    @obj = Part.new(part_params)

    if @obj.save
      redirect_to admins_parts_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @obj.update(part_params)
      redirect_to admins_parts_path
    else
      render :edit
    end
  end

  def destroy
    @obj.destroy
    redirect_to admins_parts_path
  end

  private

  def part_params
    params.require(:part).permit(
      :name
    )
  end

  def set_part
    @obj = Part.find(params[:id])
  end
end

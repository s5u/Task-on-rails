class TargetsController < ApplicationController
  def index
    @targets = Target.all
    @target = Target.find(1)
  end

  def new
    @target = Target.new
  end

  def create
    Target.create(target_params)
  end

  private
  def target_params
    params.require(:target).permit(:name, :text)
  end
end

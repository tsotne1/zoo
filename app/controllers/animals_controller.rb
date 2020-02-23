class AnimalsController < ApplicationController
  before_action :set_animal, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @animals = Animal.all
  end

  def new
    @animal = Animal.new
  end

  def edit

  end

  def create
    @animal = Animal.new(animal_params)
    @animal.user = current_user
    if @animal.save
      flash[:success] = "animal was created succ"
      redirect_to animal_path(@animal)
    else
      render 'new'
    end
  end

  def update

    if @animal.update(animal_params)
      flash[:success] = "animal was updated succ"
      redirect_to animal_path(@animal)
    else
      render 'new'
    end
  end

  def show

  end

  def search
    @result = Animal.search(params[:search])
  end

  def destroy
    @animal.destroy
    flash[:danger] = "animals deleted succ"
    redirect_to animals_path
  end

  private
    def set_animal
      @animal = Animal.find(params[:id])
    end

    def animal_params
      params.require(:animal).permit(:name, :animal_class, :age, :gender, :description,  category_ids: [])
    end

    def require_same_user
      if current_user != @animal.user and !current_user.admin?
        flash[:danger] = "You can only edit or delte your own animals"
        redirect_to root_path
      end
    end
end

class UsersController < ApplicationController
  # GET /users
  # GET /users.json

  before_filter :signed_in_user, only: [:index, :edit, :update,:destroy]

  before_filter :admin_user,     only: :destroy




  def index
    @users = User.all
     @users = User.paginate(page: params[:page])

    respond_to do |format|
      format.html # index.html.erb      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit

  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
   def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user

      redirect_to @user

    else
      render 'new'
    end
  end



  # PUT /users/1
  # PUT /users/1.json
   def update
     @user = User.find(params[:id])


     if @user.update_attributes(params[:user])
       flash[:success] = "Profile updated"
        redirect_to user_path(@user)

     else
        render 'edit'

     end
  end




  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path

  end
  private

  #def signed_in_user
   # redirect_to signin_path, notice: "Please sign in." unless signed_in?
  #end

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end




end

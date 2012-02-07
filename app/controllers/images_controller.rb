class ImagesController < ApplicationController

  def index
    @number_files_fun_curiosities = %x{ls #{Rails.root}/public/images/fun_curiosities/ | wc -l}.strip.to_i
    @number_files_cars = %x{ls #{Rails.root}/public/images/cars/ | wc -l}.strip.to_i
  end

  def fun_curiosities
    select_files(%x{ls --format=commas #{Rails.root}/public/images/fun_curiosities/}.strip.split(", "))
  end

  def cars
    select_files(%x{ls --format=commas #{Rails.root}/public/images/cars/}.strip.split(", "))
  end

  def send_file
    if params[:sender_name].blank? or params[:receiver_email].blank? or params[:type].blank? or params[:file].blank?
      flash.now[:alert] = "Please, fill in all the fields!"
      render :action => :send_by_email
      return
    end

    spawn do
      Mailer.deliver_file(params[:sender_name], params[:receiver_email], params[:type], params[:file])
    end

    flash[:success] = "We sent an email to your friend!"
    redirect_to :controller => :images, :action => params[:type], :file => params[:file]
  end

  private

  def select_files(files)
    if not params[:file].blank?
      @current_file = params[:file]
      @next_file = select_next_file(@current_file, files)
      return
    end

    file_names = files[Kernel.rand(files.size)].split(",\n")
    @current_file = file_names[Kernel.rand(file_names.size)]
    @next_file = select_next_file(@current_file, files)
  end

  def select_next_file(current_file, files)
    next_file = nil
    while next_file.blank? do
      file_names = files[Kernel.rand(files.size)].split(",\n")
      random_file = file_names[Kernel.rand(file_names.size)]
      next_file = random_file if current_file != random_file
    end

    next_file
  end

end

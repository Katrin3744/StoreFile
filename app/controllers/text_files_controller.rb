class TextFilesController < ApplicationController
  include Encryption::Crypto
  before_action :find_file, only: [:destroy, :download_file]

  def index
    @text_files = TextFile.all
  end

  def new
    @text_file = TextFile.new
  end

  def create
    if params[:txt_file].present?
      @text_file = TextFile.new(file_params)
      if @text_file.save
        @text_file.encrypt_text_file
        redirect_to text_files_path
      else
        render :new
      end
    else
      redirect_to new_text_file_path, notice: 'FILE was not choose'
    end
  end

  def destroy
    @text_file.destroy
    redirect_to text_files_path
  end

  def download_file
    send_file decrypt(@text_file.txt_file)
  end

  private

  def file_params
    params.require(:text_file).permit(:txt_file)
  end

  def find_file
    @text_file = TextFile.find(params[:id])
  end
end

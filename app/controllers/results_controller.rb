class ResultsController < ApplicationController
  def index
    @text_files= TextFile.search_everywhere(params[:query])
    unless @text_files.present?
      redirect_to text_files_path, notice: 'Nothing was found'
    end
  end
end

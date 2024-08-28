class UsersController < ApplicationController
  def upload_csv
    result = CsvParser.new(params[:csv_file]).call

    if result
      flash[:notice] = 'CSV uploaded and processed successfully.'
    else
      flash[:notice] = 'Error while processing'
    end

    redirect_to root_path
  end
end

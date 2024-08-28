class UsersController < ApplicationController
  def upload_csv
    result = CsvParser.new(params[:csv_file]).call
    flash[:notice] = if result[:success]
                       'CSV uploaded and processed successfully.'
                     else
                       result[:errors]
                     end

    redirect_to root_path
  end
end

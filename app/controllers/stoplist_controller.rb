
class StoplistController < ApplicationController

  def index
    @phones = Stoplist.all
  end

  def new
    @errors ||= nil
  end

  def upload
    @my_file = params[:my_file]
    @correct_phones = []
    @incorrect_phones = []
    # Check that file is attached
    if params[:my_file]
    # Check that is excel file
    if ['.xls','.xlsx', '.xlsb'].include?(File.extname(@my_file))
      xlsx = Roo::Spreadsheet.open(@my_file.tempfile.path, extension: :xlsx)
      xlsx.column(1).each do |phone|
        # Create new validated array with phones and add to db
        if Stoplist.create(phone: phone).valid?
          @correct_phones << phone
        else
          @incorrect_phones << phone
        end
      end

      render :upload
    else
      @errors = "Bad file format. You need upload only Excel file."
      render :new
    end
    else
      @errors = 'You must attach file'
      render :new
    end

  end
end

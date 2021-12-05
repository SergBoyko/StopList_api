module Api
  module V1
    class PhoneController < ApplicationController
      skip_before_action :verify_authenticity_token
      def check
        phone = params['phone']
        resp = { found: '' }
        resp[:found] = if Stoplist.exists?(phone: phone)
                         1
                       else
                         0
                       end
        render json: resp, status: :ok
      end
    end
  end
end

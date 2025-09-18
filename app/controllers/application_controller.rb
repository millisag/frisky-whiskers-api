class ApplicationController < ActionController::API
    
  
    def authenticate_request
      header = request.headers['Authorization']
      header = header.split(' ').last if header
      puts header
      begin
        decoded = JWT.decode(header, Rails.application.credentials.secret_key_base)[0]
        @current_user = User.find(decoded['user_id'])
      rescue
        render json: { errors: 'Unauthorized' }, status: :unauthorized
      end
    end
  end     

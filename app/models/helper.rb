class Helper < ActiveRecord::Base
    def self.is_logged_in?(session)
      !!session[:user_id]
    end

    def self.current_user(session)
      User.find(session[:user_id])
    end

    def self.clearance?(session, object)
      Helper.is_logged_in?(session) && (Helper.current_user(session).id == object.user_id)
    end
end
  
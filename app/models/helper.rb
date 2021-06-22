class Helper < ActiveRecord::Base
    def self.is_logged_in?(session)
      !!session[:user_id]
    end

    def self.current_user(session)
      User.find(session[:user_id])
    end

    def self.clearance?(session)
      #reference controller for object type?
      self.is_logged_in?(session) && (self.current_user(session).id == self.user_id)
    end
end
  
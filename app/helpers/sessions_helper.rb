module SessionsHelper
    def login(user)
        session[:id] = user.id
    end

    def current_user(user)
        @current_user ||= user
    end

    def current_user
        if (user_id = session[:id])
             @current_user ||= User.find_by(id: user_id)
        end
    end

    def logout
        session.delete(:id)
        @current_user = nil
    end

    def logged_in?
        !current_user.nil?
    end
end

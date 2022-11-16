class ApplicationController < ActionController::Base
    # rescue_form LoginFailed, with: :login_failed 

    # def login_failed
    #     render template: "shared/login_failed", status: 401
    # end

    before_action :detect_mobile_variant

    private


    # UserAgentがiPhoneの場合varientにmobileを設定
    def detect_mobile_variant
        request.variant = :mobile if request.user_agent =~ /iPhone/
    end
end

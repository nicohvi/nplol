class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def setup_negative_captcha
    @captcha = NegativeCaptcha.new(
        # A secret key entered in environment.rb. 'rake secret' will give you a good one.
        secret: NEGATIVE_CAPTCHA_SECRET,
        spinner: request.remote_ip,
        # Whatever fields are in your form
        fields: [:name, :text],
        params: params
    )
  end
end

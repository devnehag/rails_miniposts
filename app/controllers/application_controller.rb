class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception #Protection against CSRF, generates a unique token for each session and verifies authenticity of that token with each post request.
    include SessionsHelper # include SessionsHelper includes the `SessionsHelper` module into the `ApplicationController`. This makes the methods defined in `SessionsHelper` available to all controllers (since they all inherit from `ApplicationController`) and also to all views. The `SessionsHelper` module typically contains methods related to user sessions, like logging in and out.

end

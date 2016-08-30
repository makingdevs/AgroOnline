module WelcomeHelper
  def user_in_session
    if session[:user_id]
      @user = User.find(session[:user_id])
      content_tag(:i) do
        concat " <i class='fa fa-user fa-lg' aria-hidden='true'></i>".html_safe
        concat " Bienvenido #{@user.username}  "
        concat link_to(" <small>cuenta </small> &ensp;".html_safe, profile_path(@user.provider.id))
        concat link_to("Logout", logout_path, :class => "waves-effect waves-light btn")
      end
    else
      content_tag(:i) do
        concat link_to("LogIn", login_path, :class => "waves-effect waves-light btn")
      end
    end
  end
end

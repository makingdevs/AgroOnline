module WelcomeHelper
  def user_in_session
    if session[:user_id]
      @user = User.find(session[:user_id])
      content_tag(:i) do
        concat " <i class='fa fa-user fa-lg' aria-hidden='true'></i>".html_safe
        concat " Bienvenido #{@user.username}  "
        if @user.provider
          concat link_to(" <small>Cuenta </small> &ensp;".html_safe, profile_path(@user.try(:provider).try(:id)))
        end
        concat link_to("Salir", logout_path, :class => "waves-effect waves-light btn")
      end
    else
      content_tag(:i) do
        concat link_to("Crear Cuenta", new_user_path, :class => "waves-effect waves-light btn")
        concat "  "
        concat link_to("Acceder", login_path, :class => "waves-effect waves-light btn")
      end
    end
  end
end

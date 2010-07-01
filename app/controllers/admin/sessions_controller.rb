class Admin::SessionsController < ActionController::Base
  layout 'admin/application'
  
  def new
  end
  
  def create
    @email_address = params[:email_address]
    @password = params[:password]
    if login(@email_address, @password)
      redirect_to return_to_url || admin_pages_url
    else
      flash[:error] = "Nope.. that's not correct"
      render :new
    end
  end
  
  def destroy
    reset_session
    redirect_to '/'
  end
  
  
  private
  
  def login(email_address, password)
    request.session_options.delete(:id)
    session['admin_user_id'] = User.authenticate(email_address, password).try(:id)
  end
  
  def return_to_url
    session.delete('admin_return_to')
  end
  
end
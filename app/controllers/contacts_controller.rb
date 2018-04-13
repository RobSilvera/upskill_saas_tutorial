class ContactsController < ApplicationController
  
  # GET request to /contact-us
  # Show new contact form
  def new
    @contact = Contact.new
    
  end  
  
  # POST request /contacts
  def create
    
    # Mass assignment of form fields into Contact object
    @contact = Contact.new(contact_params)
    
    #Save Conject to dataase
    if @contact.save
      # Store form fields via params into variables
      name = params[:contact] [:name]
      email = params[:contact] [:email]
      comments = params[:contact] [:comments]
      
      # Injects variables into ContactMailer 
      # mail method and send email
      ContactMailer.contact_email(name, email, comments).deliver
      
      # Relaods contact page with message
      flash[:success] = "Have a Blessed Day!"
      redirect_to new_contact_path
    else
      flash[:danger] = @contact.errors.full_messages.join(". ")
      redirect_to new_contact_path 
    end
  end
  
  private
    # To collect data from forms, we need to use
    # strong parameters and whitelist the form fields
    def contact_params
      params.require(:contact).permit(:name, :email, :comments)
    
    end
end
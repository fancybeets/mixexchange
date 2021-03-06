class ContactsController < ApplicationController
    def new
        @contact = Contact.new
    end
    
    def create
        @contact = Contact.new(contact_params)
        if @contact.save
            name = params[:contact][:name]
            email = params[:contact][:email]
            body = params[:contact][:comments]
            if(ContactMailer.contact_email(name,email,body))
                puts "Mailing succeeded"
                puts ContactMailer.contact_email(name,email,body)
            else
                puts "Mailing failed"
            end
            flash[:success] = "Message sent."
            redirect_to new_contact_path
        else
            flash[:danger] = "Error sending message."
            redirect_to new_contact_path
        end
    end
    private
        def contact_params
            params.require(:contact).permit(:name,:email,:comments) 
        end
end
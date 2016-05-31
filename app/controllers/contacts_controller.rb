class ContactsController < ApplicationController
  def index
    user = User.find_by(id: params[:user_id])
    shared_contacts = user.shared_contacts
    shared_contacts += user.contacts

    render json: shared_contacts
  end

  def show
    contact = Contact.find_by(id: params[:id])
    render json: contact
  end

  def create
    contact = Contact.new(contact_params)
    if contact.save
      render json: contact
    else
      render(
        json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def update
    contact = Contact.find_by(id: params[:id])
    contact.update!(contact_params)
    render json: contact
  end

  def destroy
    contact = Contact.find_by(id: params[:id])
    render json: contact
    contact.destroy!

  end

  private
  def contact_params
    params.require(:contact).permit(:user_id, :name, :email)
  end
end

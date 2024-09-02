class ContactsController < ApplicationController
  before_action :set_contact, only: %i[show edit update destroy]

  def index
    @contacts = Contact.all.order(:first_name, :last_name)
    if params[:query].present?
      @contacts = @contacts.where("first_name ILIKE ? OR last_name ILIKE ?", "%#{params[:query]}%",
                                  "%#{params[:query]}%")
    end
  end

  def show
    @contacts = Contact.all.order(:first_name, :last_name)
  end

  def new
    @contact = Contact.new
  end

  def edit
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      redirect_to @contact, notice: "Contact was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @contact.update(contact_params)
      redirect_to @contact, notice: "Contact was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @contact.destroy!
    redirect_to contacts_url, notice: "Contact was successfully destroyed.", status: :see_other
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :phone, :birthday)
  end
end

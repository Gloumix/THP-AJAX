require 'faker'

class EmailsController < ApplicationController

    def index
        @emails = Email.all
    end

    def show

        @email = Email.find(params[:id])
        if @email.read == false
            @email.update(read: true)
        end

        respond_to do |format|
            format.html { }
            format.js {}
        end 
    end

    def new
        @email = Email.new
    end

    def create
        @email = Email.new(object: Faker::Book.title, body: Faker::Lorem.paragraph_by_chars)
        @email.save
        respond_to do |format|
            format.html { redirect_to emails_path }
            format.js {}
        end 
    end

    def destroy

        @email =  Email.find(params[:id])
        @email.destroy

        respond_to do |format|
            format.html { redirect_to emails_path }
            format.js {}
        end 
    end

    def edit
        @email = Email.find(params[:id])
    end


    def update

        @email = Email.find(params[:id])
        if @email.read == true
            @email.update(read: false)
        else
            @email.update(read: true)
        end

        
        respond_to do |format|
            format.html { }
            format.js {}
        end 
    end

end

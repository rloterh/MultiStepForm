# frozen_string_literal: true

module Intake
  class AccountsController < ApplicationController
    def new
      @account = Account.new
    end

    def create
      @account = Account.new(account_params)

      if @account.valid?

        # The values from the previous form step need to be

        # retrieved from the session store.

        full_params = account_params.merge(
          first_name: session['profile']['first_name'],

          last_name: session['profile']['last_name']
        )

        # Here we finally carry out the ultimate objective:

        # creating a User record in the database.

        User.create!(full_params)

        # Upon successful completion of the form we need to

        # clean up the session.

        session.delete('profile')

        redirect_to users_path

      else

        render :new

      end
    end

    private

    def account_params
      params.require(:intake_account).permit(
        :email,
        :password
      )
    end
  end
end

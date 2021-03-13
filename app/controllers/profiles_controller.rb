# frozen_string_literal: true

module Intake
  class ProfilesController < ApplicationController
    def new
      # An instance of Profile is created just the

      # same as you would for any Active Record object.

      @profile = Profile.new
    end

    def create
      # Again, an instance of Profile is created

      # just the same as you would for any Active

      # Record object.

      @profile = Profile.new(profile_params)

      # The valid? method is also called just the same

      # as for any Active Record object.

      if @profile.valid?

        # Instead of persisting the values to the

        # database, we're temporarily storing the

        # values in the session.

        session[:profile] = {

          'first_name' => @profile.first_name,

          'last_name' => @profile.last_name

        }

        redirect_to new_intake_account_path

      else

        render :new

      end
    end

    private

    # The strong params work exactly as they would

    # for an Active Record object.

    def profile_params
      params.require(:intake_profile).permit(
        :first_name,
        :last_name
      )
    end
  end
end

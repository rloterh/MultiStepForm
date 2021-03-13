# frozen_string_literal: true

module Intake
  class Profile
    include ActiveModel::Model
    attr_accessor :first_name, :last_name

    validates :first_name, presence: true
    validates :last_name, presence: true
  end
end

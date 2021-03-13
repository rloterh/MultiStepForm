# frozen_string_literal: true

module Intake
  class Account
    include ActiveModel::Model
    attr_accessor :email, :password

    validates :email, presence: true
    validates :password, presence: true
  end
end

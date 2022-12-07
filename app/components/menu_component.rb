# frozen_string_literal: true

class MenuComponent < ViewComponent::Base
  def initialize(user:)
    @user = user
  end
end

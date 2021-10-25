# frozen_string_literal: true

# base model for application
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end

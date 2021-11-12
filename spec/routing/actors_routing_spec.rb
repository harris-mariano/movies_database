# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ActorsController, type: :routing do
  describe 'routing' do
    it 'routes to #show' do
      expect(get: '/actors/1').to route_to('actors#show', id: '1')
    end
  end
end

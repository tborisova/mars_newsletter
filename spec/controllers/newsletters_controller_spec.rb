require 'rails_helper'

describe NewslettersController do

  context '#index' do

    it 'does not require logged in user' do
      get :index

      expect(response.status).to be(200)
    end

    it 'returns all newsletters as json' do
      newsletters = object_double('newsletters')

      expect(newsletters).to receive(:to_json).with(include: :entries).and_return 'newsletters_as_json'
      allow(Newsletter).to receive(:all).and_return newsletters

      get :index

      expect(response.body).to eq 'newsletters_as_json'
    end
  end
end
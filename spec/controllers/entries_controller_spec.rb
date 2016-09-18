require 'rails_helper'

describe EntriesController do

  context '#create' do

    it 'requires logged in user' do
      post :create, entry: { title: 'Title' } 

      expect(response.status).to be(401)
    end

    context 'logged in user' do
      before(:all) do
        @user = FactoryGirl.create(:user)
      end

      before(:each) do
        login_user @user
      end

      let(:entries) { object_double('entries').as_null_object }
      let(:entry) { object_double('entry', to_json: 'entry_as_json').as_null_object }

      it 'creates entry by the logged in user' do
        allow(entries).to receive(:new).and_return entry
        
        expect(@user).to receive(:entries).and_return entries

        post :create, entry: { title: 'Title' } 
      end

      it 'creates entry from params' do
        allow(@user).to receive(:entries).and_return entries

        expect(entries).to receive(:new).with({ title: 'Title' }).and_return entry
        expect(entry).to receive(:save)

        post :create, entry: { title: 'Title' } 
      end

      it 'returns the created entry as json' do
        allow(entries).to receive(:new).and_return entry
        allow(@user).to receive(:entries).and_return entries

        post :create, entry: { title: 'Title' } 

        expect(response.body).to eq 'entry_as_json'
      end
    end
  end
end
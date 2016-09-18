require 'rails_helper'

describe MakeNewsletter do

  context '#perform' do

    it 'creates newsletter with all entries for the past week' do
      included_entry = create(:entry, created_at: 2.days.ago)
      not_included_entry = create(:entry, created_at: 2.weeks.ago)

      expect{
        MakeNewsletter.new.perform
      }.to change(Newsletter, :count).by(1)

      expect(Newsletter.last.entries).to eq [included_entry]
    end
  end
end
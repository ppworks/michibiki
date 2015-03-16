require 'rails_helper'

describe 'skip feature' do
  scenario 'redirect to profile editing page' do
    visit '/'
    expect(current_path).to eq 'profile/edit'
  end

  scenario 'redirect to profile editing page & skip editing' do
    visit '/'
    click 'skip'
    expect(current_path).to eq '/'
  end
end

require 'features_helper'

describe 'visit home' do
  it 'is succesful' do
    visit('/')
    expect(page.status_code).to be(200)
  end
end

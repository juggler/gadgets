require 'spec_helper'

feature 'Searching gadgets' do
  let(:user) { create(:user, email: 'nick@example.com') }
  let(:another_user) { create(:user, email: 'leo@example.com') }

  let!(:gadget_1) { create(:gadget, name: 'WD 500', user: user) }
  let!(:gadget_2) { create(:gadget, name: 'T1000', user: user) }
  let!(:gadget_3) { create(:gadget, name: 'Another one', user: user) }
  let!(:gadget_4) { create(:gadget, name: 'Not mine #00', user: another_user) }

  background do
    sign_in user
  end

  scenario 'Search existing gadgets' do
    visit '/'

    fill_in 'name', with: '00'
    click_on 'Search'

    expect(page).to have_text 'WD 500'
    expect(page).to have_text 'T1000'

    expect(page).not_to have_text 'Not mine'
    expect(page).not_to have_text 'Another one'
  end

  scenario 'Search unavailable gadgets' do
    visit '/'

    fill_in 'name', with: 'Not mine'
    click_on 'Search'

    expect(page).to have_text 'Nothing found'

    expect(page).not_to have_text 'Not mine'
  end
end

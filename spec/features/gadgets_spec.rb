require 'spec_helper'

feature 'Gadgets' do
  let(:user) { create(:user, email: 'nick@example.com') }
  let(:another_user) { create(:user, email: 'leo@example.com') }

  let!(:gadget_1) { create(:gadget, name: 'WD 500', user: user) }
  let!(:gadget_2) { create(:gadget, name: 'Not mine', user: another_user) }

  background do
    sign_in user
  end

  scenario 'List of gadgets' do
    visit '/'

    expect(page).to have_text('Inspector Gadget')
    expect(page).not_to have_text('Not mine')
  end

  scenario 'Adding a new gadget' do
    visit '/'

    click_link 'Add'

    expect(page).to have_text('New gadget')

    fill_in 'gadget[name]', with: 'Awesome stuff'
    expect {
      click_on 'Create Gadget'
    }.to change {
      Gadget.count
    }.from(2).to(3)

    expect(page).not_to have_text('New gadget')
    expect(page).to have_text('Awesome stuff')
  end

  scenario 'Editing and existing gadget' do
    visit gadget_path(gadget_1)

    expect(page).to have_text('WD 500')

    click_link 'Edit'

    fill_in 'gadget[name]', with: 'T1000'
    expect {
      click_on 'Update Gadget'
    }.to change {
      gadget_1.reload.name
    }.from('WD 500').to('T1000')
  end
end

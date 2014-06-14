require 'spec_helper'

feature "Gadgets" do
  background do
    user = create(:user)
    another_user = create(:user)
    create(:gadget, name: 'Inspector Gadget', user: user)
    create(:gadget, name: 'Not mine', user: another_user)
  end

  scenario "List of gadgets" do
    visit "/"

    expect(page).to have_text('Inspector Gadget')
    expect(page).not_to have_text('Not mine')
  end
end

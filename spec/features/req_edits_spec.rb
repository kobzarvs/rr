require 'rails_helper'

feature "ReqEdits", :type => :feature do
#  pending "add some scenarios (or delete) #{__FILE__}"
  scenario "Edit Requirement", js: true do
    # visit '/sub_types/new'
    # fill_in 'sub_type_name', with: 'NFR'
    # click_button 'Create sub type'
    
    st = create(:sub_type_NFR)
    subject = create(:subject_req1)
    visit '/subjects'
#    fill_in 'subject_name', with: 'new subject'
#    click_button 'Create subject'

    save_screenshot('/vagrant/rr/file.png', :full => true)
  end
end

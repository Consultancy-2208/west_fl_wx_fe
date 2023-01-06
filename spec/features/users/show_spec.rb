require 'rails_helper'

RSpec.describe 'Users show page' do
  describe 'When I visit /users/:id' do
    before do
      @user = create(:user)
      create(:plan, user: @user, review_insurance_docs: true)
      visit user_path(@user)
    end
    describe "Then I see" do
      describe 'A checklist' do
        it 'That has manditory sections: "Plan", "Records", and "Prep Kit"' do
          save_and_open_page
          within '#base-checklist' do
            expect(page).to have_content("Plan")
            expect(page).to have_content("Review Insurance Documents")
            # expect(page).to have_content("Records")
            # expect(page).to have_content("Medical")
            # expect(page).to have_content("Prep Kit")
            # expect(page).to have_content("Extra Batteries")
            expect(page).to have_button("Update")
          end
        end
        it 'That has optional sections, chosen by user: Car and House'
        it 'That has optional sections, chosen by user: Kids and House'
        it 'When I check a box and click on "Update" that users plan is updated' do
          expect(@user.plan.check_evac_zone).to be(false)
          within '#base-checklist' do
            check 'plan_check_evac_zone'
            click_button 'Update'

            expect(@user.plan.check_evac_zone).to be(true)
          end
        end
      end
      describe 'A "Check-WX button' do
        context 'When I press "Check-WX" and an alert exists' do
          it 'A flash message is returned'
          it 'An email is sent'
        end
        context 'When I press "Check-WX" and there is NO alert' do
          it 'A flash message is returned'
        end
      end
    end
  end
end
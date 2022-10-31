require 'rails_helper'
RSpec.describe 'user_show', type: :feature do
   before(:each) do
    @user = User.create(
        name: 'muhammed ashraf',
        photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
        bio: 'full_stack programmer'
        posts_counter: 0
    )
    visit root_path
   end

   it 'show the name of the user' do 
    expect(page).to have_content("#{@user.name}")
   end
end
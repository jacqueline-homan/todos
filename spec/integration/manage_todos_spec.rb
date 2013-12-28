require 'spec_helper'

feature 'Manage todos' do
  scenario 'create new todo' do
  	sign_in
  	click_link 'Add new todo'
  	fill_in 'Description', with: 'Read three chapters of RSpec book'
  	click_button 'Create todo'
  	expect(page).to have_css 'li.todo', text: 'Read three chapters of RSpec book'
  end
## The following def block was moved into a module
## to keep our features nice and slim. 
## The logic for signing in is in a module
## that can be managed separately, so if the logic for
## signing in changes, it's all contained in the module.
 

#  def sign_in
#  	visit root_path
#  	fill_in 'Email address', with: 'person@email.com'
#  	click_button 'Sign In'
#  end

end

	

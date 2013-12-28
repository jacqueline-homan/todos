require 'spec_helper'

feature 'Manage todos' do
  scenario 'create new todo' do
  	visit root_path
  	fill_in 'Email address', with: 'person@example.com'
  	click_button 'Sign In'
  	click_link 'Add new todo'
  	fill_in 'Description', with: 'Read three chapters of RSpec book'
  	click_button 'Create todo'
  	expect(page).to have_css 'li.todo', text: 'Read three chapters of RSpec book'
  end
end

	

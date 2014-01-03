require 'spec_helper'

feature 'Manage todos' do
  scenario 'create new todo' do
    sign_in

    create_todo_with_description 'Read three chapters of RSpec book'

    user_sees_todo_item 'Read three chapters of RSpec book'
    # RSpec deletes all the todos from the database
  end

  scenario 'view only my todos' do
    # todo = Todo.where(description: 'Read three chapters of RSpec book').first
    # expect(todo).to be_nil
    sign_in_as 'me@example.com'
    
    create(:todo, description: 'Buy coffee cream', owner_email: 'not_me@example.com')
    
    user_sees_todo_item 'Buy coffee cream'  
    user_does_not_see_todo_item 'Buy bread'
  end

  scenario 'denote completed todos' do    
    sign_in

    create_todo_with_description 'Buy coffee cream'    
    
    user_sees_completed_todo_item 'Buy coffee cream'    
  end

  def complete_todo(description)
    within "li.todo:contains('#{description}')" do
      click_link 'Complete'
    end
  end   


  def create_todo_with_description(description)
    click_link 'Add new todo'
    fill_in 'Description', with: description
    click_button 'Create todo'
  end

  def user_sees_todo_item(description)
    expect(page).to have_css 'li.todo', text: description    
  end

  def user_sees_completed_todo_item(description)
    expect(page).to have_css 'li.todo.completed', text: description
  end

  def user_does_not_see_todo_item(description)
    expect(page).not_to have_css 'li.todo', text: description
  end

## The following def block was moved into a module
## to keep our features nice and slim. 
## The logic for signing in is in a module
## that can be managed separately, so if the logic for
## signing in changes, it's all contained in the 
## SignInHelpers module under spec/support.
 

#  def sign_in
#  	visit root_path
#  	fill_in 'Email address', with: 'person@email.com'
#  	click_button 'Sign In'
#  end
end

	

require 'rails_helper'

RSpec.feature 'Category index', type: :feature do
  background do
    visit new_user_session_path
    @user = User.create(name: 'zack', email: 'zack@mail.com', password: '123456')
    @category = Category.create(author_id: @user.id, name: 'Food', icon: 'https://images.unsplash.com/photo-1553846830-8fb467fe2453?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=874&q=80')
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    click_button 'Log in'
    visit categories_path
  end

  scenario 'display My Categories on page' do
    expect(page).to have_content('Food')
    expect(page).to have_content('Total amount spent: ')
  end

  scenario 'display Category details on page' do
    expect(page).to have_content @category.name
  end

  scenario 'display Add New Category button on page' do
    expect(page).to have_link 'New category'
  end

  scenario 'When I click on Add category, I am redirected to that Category\'s new page.' do
    click_link('New category')
    expect(page).to have_current_path new_category_path
  end
end

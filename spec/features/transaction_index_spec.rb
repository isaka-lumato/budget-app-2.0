require 'rails_helper'

RSpec.feature 'Transaction index', type: :feature do
  background do
    visit new_user_session_path

    @user = User.create(name: 'Ray', email: 'him@mail.com', password: '123456')
    @category = Category.create(author_id: @user.id, name: 'Food', icon: 'https://images.unsplash.com/photo-1553846830-8fb467fe2453?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=874&q=80')
    @transaction = Transaction.create(name: 'Burger', amount: 10, author_id: @user.id, categories_id: @category.id)
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    click_button 'Log in'
    visit "/categories/#{@category.id}/"
  end

  scenario 'display My Transactions on page' do
    expect(page).to have_content('Sign Out')
    expect(page).to have_content('Total spent:')
  end

  scenario 'display Add new transaction button on page' do
    expect(page).to have_content 'New Transaction'
  end
end

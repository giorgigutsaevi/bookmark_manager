require 'pg'

feature 'Viewing bookmarks' do
  scenario 'Visiting /bookmarks route shows all the bookmarks' do
    # ADDING the test data
    Bookmark.create(url: "http://www.makersacademy.com", title: 'Makers')
    Bookmark.create(url: "http://www.google.com", title: "Google")
    Bookmark.create(url: "http://www.apple.com", title: "Apple")
    visit('/bookmarks')

    expect(page).to have_link("Google", href: "http://www.google.com")
  end
end

feature 'Adding a new bookmark' do
  scenario 'A user can add a bookmark to our Bookmark Manager' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://www.example.org')
    fill_in('title', with: 'Test Bookmark')
    click_button('Submit')

    expect(page).to have_link("Test Bookmark", href: "http://www.example.org")
  end
end
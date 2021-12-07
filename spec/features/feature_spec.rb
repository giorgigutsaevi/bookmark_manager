require 'pg'

feature 'Viewing bookmarks' do
  scenario 'Visiting /bookmarks route shows all the bookmarks' do
    # ADDING the test data
    Bookmark.create(url: "http://www.makersacademy.com")
    Bookmark.create(url: "http://www.destroyallsoftware.com")
    Bookmark.create(url: "http://www.google.com")
    Bookmark.create(url: "http://www.apple.com")
    visit('/bookmarks')
    expect(page).to have_content('http://www.apple.com')
  end
end

feature 'Adding a new bookmark' do
  scenario 'A user can add a bookmark to our Bookmark Manager' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://example.org')
    click_button('Submit')

    expect(page).to have_content 'http://example.org'
  end
end
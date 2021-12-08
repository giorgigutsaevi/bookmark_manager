# frozen_string_literal: true
require 'bookmark'
require "database_helpers"

describe Bookmark do
  subject {Bookmark.new(id: 3, title: "EV", url: "http://www.tesla.com")}
  
  context '#initalization' do
    it 'creates an instance of the given class' do
      expect(subject).to be_an_instance_of(Bookmark)
    end
  end

  context ".create" do
    it "creates a new bookmark based on user's input" do
    
    bookmark = Bookmark.create(url: 'http://www.example.org', title: "Test Bookmark")
    persisted_data = persisted_data(id: bookmark.id)
    expect(bookmark).to be_a Bookmark
    expect(bookmark.id).to eq persisted_data['id']
    expect(bookmark.title).to eq 'Test Bookmark'
    expect(bookmark.url).to eq 'http://www.example.org'
    end
  end

  context '.all method' do
    it 'returns a list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      
      # Adding the test data
      bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
      Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
      Bookmark.create(url: "http://www.google.com", title: "Google")
  
      bookmarks = Bookmark.all
      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end

  context ".delete" do
    it 'deletes the given bookmark' do
      bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')

      Bookmark.delete(id: bookmark.id)

      expect(Bookmark.all.length).to eq 0
    end
  end




end

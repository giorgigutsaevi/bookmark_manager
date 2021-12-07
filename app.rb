# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    "Bookmark Manager"
  end

  get '/bookmarks' do
    # Print the ENV variable
    # p ENV
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  get "/bookmarks/new" do
    erb :"bookmarks/new"
  end

  post "/bookmarks" do
    Bookmark.create(url: params[:url])
    redirect '/bookmarks'
  end

  run! if app_file == $PROGRAM_NAME
end

# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require 'uri'

require './lib/bookmark'
require './database_connection_setup'


class BookmarkManager < Sinatra::Base
  enable :sessions, :method_override

  register Sinatra::Flash
  
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
    flash[:notice] = "You must submit a valid URL." unless Bookmark.create(url: params[:url], title: params[:title])

    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    p params
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  get "/bookmarks/:id/edit" do
    @bookmark = Bookmark.find(id: params[:id])
    erb :'bookmarks/edit'
  end

  patch '/bookmarks/:id' do
    Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
    redirect '/bookmarks'
  end

  run! if app_file == $PROGRAM_NAME
end

require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do

    erb :new
  end

  post '/posts' do
    Post.create(params[:blog])

    redirect to '/posts'
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post_id = Post.find_by_id(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @post_edit = Post.find_by_id(:id)
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find_by_id(params[:id])
  end
end

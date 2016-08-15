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
  	@posts = Post.create(params[:posts]).content
  	erb :index
  end

  get '/posts/:id' do
  	@post = Post.find(params[:id])
  	erb :show
  end

  get '/posts' do
  	@posts = Post.all
  	erb :index
  end

  get '/posts/:id/edit' do
  	@post = Post.find(params[:id])
  	erb :edit
  end

  patch '/posts/:id' do
  	@post = Post.find(params[:id])
  	@post.update(params[:post])
  	erb :edit
  end

  delete '/posts/:id/delete' do
  	@postdel = Post.find(params[:id])
  	@postdel.destroy
  	# redirect to '/posts'
  	erb :delete
  end

end
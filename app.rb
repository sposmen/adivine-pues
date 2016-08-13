require 'sinatra'
require './lib/adivine_pues'

# Configs
use Rack::Session::Cookie, :key => 'rack.session', :path => '/', :secret => 'some-random-string'

set :public_folder, Proc.new { File.join(root, "static") }

# Routes

get '/' do
  session[:next_page] = 1
  session[:game] = AdivinePues.new
  erb :index, layout: :layout
end

post '/next/1' do
  session[:next_page] = 2
  game = session[:game]
  game.verify_answer(0, params[:answer])
  session[:game] = game
  erb :index, layout: :layout
end

post '/next/2' do
  session[:next_page] = 3
  game = session[:game]
  game.verify_answer(1, params[:answer])
  session[:game] = game

  erb :index, layout: :layout
end

post '/next/3' do
  session[:next_page] = 4
  game = session[:game]
  game.verify_answer(2, params[:answer])
  session[:game] = game

  erb :index, layout: :layout
end

post '/next/4' do
  session[:next_page] = 5
  game = session[:game]
  game.verify_answer(3, params[:answer])
  session[:game] = game

  erb :index, layout: :layout
end

post '/next/5' do
  game = session[:game]
  game.verify_answer(4, params[:answer])

  session[:result] = game.get_final_score
  erb :answer, layout: :layout
end
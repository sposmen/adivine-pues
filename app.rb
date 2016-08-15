require 'sinatra'
require './lib/adivine_pues'

class Application < Sinatra::Base

  # Configs

  use Rack::Session::Cookie, :key => 'rack.session', :path => '/', :secret => 'some-random-string'
  set :public_folder, Proc.new { File.join(root, "static") }


  # Routes

  get '/' do
    session[:next_page] = 1
    session[:game] = AdivinePues.new
    erb :index, layout: :layout
  end

  post '/next/:id' do
    id = params[:id].to_i
    session[:next_page] = id + 1
    game = session[:game]
    result = game.verify_answer(id - 1, params[:answer])
    game.set_hint_used params[:hint] if result
    session[:game] = game
    session[:result] = game.get_final_score
    erb id != 5 ? :index : :answer, layout: :layout
  end

end

require 'sinatra'
require './lib/adivine_pues'

# Configs
use Rack::Session::Cookie, :key => 'rack.session', :path => '/', :secret => 'some-random-string'

set :public_folder, Proc.new { File.join(root, "static") }

# Routes

get '/' do
  session[:question] = AdivinePues.new.question[0]
  erb :index, layout: :layout
end

post '/validar' do
  question = session[:question]
  session[:is_correct] = question.is_right_answer? params[:answer]
  erb :answer, layout: :layout
end
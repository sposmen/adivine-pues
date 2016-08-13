require 'sinatra'
require './lib/adivine_pues'

enable :sessions

set :public_folder, Proc.new { File.join(root, "static") }

get '/' do
  session[:question] = AdivinePues.new.question[0]
  erb :index, layout: :layout
end

post '/validar' do
  question = session[:question]
  session[:is_correct] = question.is_right_answer? params[:answer]
  erb :answer, layout: :layout
end
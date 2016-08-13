require 'sinatra'
enable :sessions

get '/' do
  erb :index, layout: :layout
end

post '/validar' do
  session[:is_correct] = params[:answer] == 'Batman begins'
  erb :answer, layout: :layout
end
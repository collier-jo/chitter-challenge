require 'sinatra/base'
require 'sinatra/flash'


class Chitter < Sinatra::Base
  register Sinatra::Flash
  enable :sessions

  get '/' do 
    'Welcome to Chitter'
  end 

  get '/chitter' do
    @peep = session[:peep]
    erb(:'main_page')
  end

  post '/chitter/new_peep' do
    session[:peep] = params[:peep]
    #Peep.create(text: params[:text], time: Time.new)
    redirect '/chitter'
  end 

  run! if app_file == $0

end 
      
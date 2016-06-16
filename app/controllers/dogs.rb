get '/' do
  @dogs = Dog.all

  erb :index
end

get '/session-viewer' do
  session.inspect
end

get '/dogs' do
  redirect '/login' unless session[:user_id]
  @dogs = Dog.all
  erb :index
end

get '/dogs/new' do
  @dog = Dog.new
  erb :new
end

post '/dogs' do
  # gather all the data for the new dog
  # create the new dog
  Dog.create(params[:dog])
  # send the user back to the dogs index
  redirect '/dogs'
end

get '/dogs/:id' do
  @dog = Dog.find(params[:id])
  erb :show
end

delete '/dogs/:id' do
  @dog = Dog.find(params[:id])
  @dog.destroy

  redirect '/dogs'
end

put '/dogs/:id' do
  dog = Dog.find(params[:id])
  dog.update(params[:dog])

  redirect "/dogs/#{dog.id}"
end

get '/dogs/:id/edit' do
  @dog = Dog.find(params[:id])
  erb :edit
end


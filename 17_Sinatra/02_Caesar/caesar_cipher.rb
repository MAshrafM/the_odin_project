require 'sinatra'
require 'sinatra/reloader'

def caesar_cipher(text, key)
	text = text.to_s
	key = key.to_i
	
	encryption = []
	
	text.chars.map do |ch|
		if !ch.ord.between?(65,90) && !ch.ord.between?(97,122) 
			encryption << ch
		elsif ch == ch.upcase 
			encryption << ((ch.ord - 65 + key)%26 + 65).chr
		else 
			encryption << ((ch.ord - 97 + key)%26 + 97).chr
		end
	end

	encryption.join('')
end

get '/' do
  erb :index
end

post'/' do
  text = params[:text]
  key = params[:key]
  
  encryption = caesar_cipher(text,key)
  
  erb :result, :locals => {:text => text, :encryption => encryption}
end
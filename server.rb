# encoding ; UFT-8

require 'sinatra'
require './block'

aaaaa = Dog.new

get '/' do
	"Dog" + aaaaa.my_weight
end

get '/eat'do
aaaaa.eat
'먹었음'
end
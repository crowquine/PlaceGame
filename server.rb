require 'sinatra'
require 'mongoid'
require 'json'
require "sinatra/reloader" if development?
 
Mongoid.load!("mongoid.yml")
 
 
class Location
    include Mongoid::Document
    
    field :name, type: String
    field :latitude, type: Point
    field :longitude, type: Point
end
 
get '/locations.json' do
    content_type :json
    all_companies = Location.all
    all_companies.to_json
end
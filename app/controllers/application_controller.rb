require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :super_hero
    end

    post '/teams' do
      #binding.pry
      @team_name = params[:team][:name]
      @team_motto = params[:team][:motto]

      @hero_name = []
      @hero_power = []
      @hero_bio = []

      @all_heroes = params[:team][:hero]

      @all_heroes.each do |indv_hero|
        @hero_name << indv_hero[:name]
        @hero_power << indv_hero[:power]
        @hero_bio << indv_hero[:bio]
      end

      erb :team
    end

end

require File.expand_path '../spec_helper.rb', __FILE__

describe "Sinatra Movie Application With OMDB API" do
	def app
		Sinatra::Application

  describe "Home page" do
    it "should allow accessing the home page" do
      get '/'
      last_response.should be_ok
    end
  end

describe "Search Results" do
    it "should return results for sharknado" do
      get '/results?movie=sharknado'
      last_response.should be_ok
    end
it "should return the year sharknado was made" do
      get '/results?movie=sharknado'
      last_response.should be_ok
      expect(last_response.body).to include("2013")
    end
  
   end
    it "should return the sharknado poster" do
      get '/poster/tt2724064'
      expect(last_response.body).to include("http://ia.media-imdb.com/images/M/MV5BOTE2OTk4MTQzNV5BMl5BanBnXkFtZTcwODUxOTM3OQ@@._V1_SX300.jpg")
    end
end

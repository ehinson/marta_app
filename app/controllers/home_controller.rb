class HomeController < ApplicationController

#we're going to be using a method we created in the application_helper.rb
include ApplicationHelper

#the next two lines are required to access the API
require 'open-uri'
require 'json'

#home/home
#a landing page

  def home
    # @results = JSON.parse(open("http://developer.itsmarta.com/BRDRestService/BRDRestService.svc/GetAllBus").read)
  end

#action/page where the userwill use radio buttons

  def radioselect
    # an array of all the MARTA stations
    @stations = ["North Springs", "Hamilton E. Holmes", "Lindbergh", "Midtown", "Georgia State", "Reynoldstown/Inman Park", "Dunwoody", "Lenox", "Sandy Springs", "Medical Center", "Doraville", "Chamblee", "Brookhaven/Oglethorpe", "Arts Center", "North Avenue", "Civic Center", "Ashby", "Peachtree Center", "Vine City", "West End", "Airport", "College Park", "East Point", "Philips Arena/CNN Center", "Garnett", "West Lake", "Bankhead", "Oakland City", "Lakewood/Ft. McPherson", "King Memorial", "Avondale", "East Lake", "Kensington", "Decatur", "Indian Creek", "Edgewood/Candler Park", "Inman Park/Reynoldstown", "Buckhead"]
    # @results = JSON.parse(open("http://developer.itsmarta.com/BRDRestService/BRDRestService.svc/GetAllBus").read)

   #sort the stations alphabetically

   @stations = @stations.sort_by{|item| item.downcase}

  end

  #page where the coming buses will be displayed, after the radio button choice
  def yourbuses
    #the passed parameter is set to an instance variable
    @station = params[:station]
    
    #here we pull the real-time info from MARTA and put it into a hash. Copy and paste the URL and and familiarize yourself with what data is in there.

    @results = JSON.parse(open("http://developer.itsmarta.com/BRDRestService/BRDRestService.svc/GetAllBus").read)

    hash_and_msg_generator(@results, @station) # find this method in the Application Helper
  end

#page where coming buses will be displayed as dropdowns
  def yourbuses_dropdown
    yourstation = Selection.last

    @selection = yourstation.station_name
    @results = JSON.parse(open("http://developer.itsmarta.com/BRDRestService/BRDRestService.svc/GetAllBus").read)
    
    hash_and_msg_generator(@results, @station) # find this method in the Application Helper
  end
end

class UbersController < ApplicationController
  include ApiHelper
  def index
    @response = JSON.parse(getEstimatesForUserLocation)
    @fastest_ride = @response['prices'].sort_by{ |hash| hash['duration'] }.first['duration']/60
    # @get_map = get_google_map
    @end_latitude = "40.7283405"
    @end_longitude = "-73.994567"
    @map = "http://maps.googleapis.com/maps/api/staticmap?zoom=17&format=png&sensor=false&size=280x280&maptype=roadmap&style=element:geometry.fill|color:0xf4f4f4&markers=color:red|" + @end_latitude + "," + @end_longitude + "&scale=2"
  end

  def get_route
    @response = JSON.parse(getEstimatesForUserLocation)
    @fastest_ride = @response['prices'].sort_by{ |hash| hash['duration'] }.first['duration']/60
    respond_to do |format|
      format.html { redirect_to ubers_path }
      format.js
    end
  end
end
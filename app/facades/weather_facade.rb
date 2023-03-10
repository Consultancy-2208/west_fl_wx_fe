require './app/services/west_fl_wx_service'

class WeatherFacade
  def initialize(params = nil)
    @params = params
  end

  def message
    results[:data]
  end

  def results
    @_results ||= service.query(@params[:email], @params[:name])
  end

  def service
    @_service ||= WestFLWXService.new
  end
end

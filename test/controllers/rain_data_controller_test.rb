require 'test_helper'

class RainDataControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rain_datum = rain_data(:one)
  end

  test "should get index" do
    get rain_data_url
    assert_response :success
  end

  test "should get new" do
    get new_rain_datum_url
    assert_response :success
  end

  test "should create rain_datum" do
    assert_difference('RainDatum.count') do
      post rain_data_url, params: { rain_datum: { annual: @rain_datum.annual, apr: @rain_datum.apr, aug: @rain_datum.aug, dec: @rain_datum.dec, feb: @rain_datum.feb, jan: @rain_datum.jan, jan_feb: @rain_datum.jan_feb, jul: @rain_datum.jul, jun: @rain_datum.jun, jun_sep: @rain_datum.jun_sep, mar: @rain_datum.mar, mar_may: @rain_datum.mar_may, may: @rain_datum.may, name: @rain_datum.name, nov: @rain_datum.nov, oct: @rain_datum.oct, oct_dec: @rain_datum.oct_dec, sep: @rain_datum.sep, year: @rain_datum.year } }
    end

    assert_redirected_to rain_datum_url(RainDatum.last)
  end

  test "should show rain_datum" do
    get rain_datum_url(@rain_datum)
    assert_response :success
  end

  test "should get edit" do
    get edit_rain_datum_url(@rain_datum)
    assert_response :success
  end

  test "should update rain_datum" do
    patch rain_datum_url(@rain_datum), params: { rain_datum: { annual: @rain_datum.annual, apr: @rain_datum.apr, aug: @rain_datum.aug, dec: @rain_datum.dec, feb: @rain_datum.feb, jan: @rain_datum.jan, jan_feb: @rain_datum.jan_feb, jul: @rain_datum.jul, jun: @rain_datum.jun, jun_sep: @rain_datum.jun_sep, mar: @rain_datum.mar, mar_may: @rain_datum.mar_may, may: @rain_datum.may, name: @rain_datum.name, nov: @rain_datum.nov, oct: @rain_datum.oct, oct_dec: @rain_datum.oct_dec, sep: @rain_datum.sep, year: @rain_datum.year } }
    assert_redirected_to rain_datum_url(@rain_datum)
  end

  test "should destroy rain_datum" do
    assert_difference('RainDatum.count', -1) do
      delete rain_datum_url(@rain_datum)
    end

    assert_redirected_to rain_data_url
  end
end

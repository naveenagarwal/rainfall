# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'
filename = "#{Rails.root}/rain_data.csv"

CSV.foreach(filename, headers: true) do |row|
  data = {
    name: row["SD_Name"],
    year: row["YEAR"],
    jan: row["JAN"],
    feb: row["FEB"],
    mar: row["MAR"],
    apr: row["APR"],
    may: row["MAY"],
    jun: row["JUN"],
    jul: row["JUL"],
    aug: row["AUG"],
    sep: row["SEP"],
    oct: row["OCT"],
    nov: row["NOV"],
    dec: row["DEC"],
    annual: row["ANNUAL"],
    jan_feb: row["JAN-FEB"],
    mar_may: row["Mar-May"],
    jun_sep: row["Jun-Sep"],
    oct_dec: row["Oct-Dec"],
  }
  RainDatum.create(data)
end

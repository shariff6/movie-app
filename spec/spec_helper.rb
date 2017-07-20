require("rspec")
  require("pg")
  require("movie")

  DB = PG.connect({:dbname => "cinema_test"})

  RSpec.configure do |config|
    config.after(:each) do
      DB.exec("DELETE FROM movies *;")
    end
  end

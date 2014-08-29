require 'csv'

namespace :tm do

  desc "load tm data"

  task :load_derivation_codes => :environment do
  	csv_text = File.read('db/csv/derivation_codes.csv')
    csv = CSV.parse(csv_text, :headers => true, :col_sep => ',')

    csv.each do |row|      
      DerivationCode.create!(row.to_hash)
    end
  end

  task :load_food_data_sources => :environment do
  	csv_text = File.read('db/csv/food_data_sources.csv')
    csv = CSV.parse(csv_text, :headers => true)

    csv.each do |row|
      FoodDataSource.create!(row.to_hash)
    end
  end

  task :load_food_groups => :environment do
  	csv_text = File.read('db/csv/food_groups.csv')
    csv = CSV.parse(csv_text, :headers => true)

    csv.each do |row|
      FoodGroup.create!(row.to_hash)
    end
  end

  task :load_nutrients => :environment do
  	csv_text = File.read('db/csv/nutrients.csv')
    csv = CSV.parse(csv_text, :headers => true)

    csv.each do |row|
      Nutrient.create!(row.to_hash)
    end
  end

  task :load_source_codes => :environment do
    csv_text = File.read('db/csv/source_codes.csv')
    csv = CSV.parse(csv_text, :headers => true)

    csv.each do |row|
      SourceCode.create!(row.to_hash)
    end
  end

  task :load_foods => :environment do
    csv_text = File.read('db/csv/foods.csv')
    csv = CSV.parse(csv_text, :headers => true)

    csv.each do |row|
      Food.create!(row.to_hash)
    end
  end

  task :load_food_nutrients => :environment do
    csv_text = File.read('db/csv/food_nutrients.csv')
    csv = CSV.parse(csv_text, :headers => true)

    csv.each do |row|
      FoodNutrient.create!(row.to_hash)
    end
  end

  task :load_food_sources => :environment do
    csv_text = File.read('db/csv/food_source.csv')
    csv = CSV.parse(csv_text, :headers => true)

    csv.each do |row|
      FoodSource.create!(row.to_hash)
    end
  end

  task :load_weights => :environment do
    csv_text = File.read('db/csv/weights.csv')
    csv = CSV.parse(csv_text, :headers => true)

    csv.each do |row|
      Weight.create!(row.to_hash)
    end
  end

  task :load_all => ['load_derivation_codes', 'load_food_data_sources', 'load_food_groups', 'load_nutrients', 'load_source_codes', 'load_foods', 'load_food_nutrients', 'load_food_data_sources', 'load_weights']
  #task :load_all => ['load_weights']

end

desc 'Populate database with default data'
task :db_populate => ['tm:load_all']
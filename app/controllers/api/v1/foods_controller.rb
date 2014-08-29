class Api::V1::FoodsController < Api::V1::ApplicationController
  before_filter :authenticate_user!
  skip_before_filter :verify_authenticity_token,
             :if => Proc.new { |c| c.request.format == 'application/json' }
	
	def index

		if params[:search]

			search_params = params[:search].permit(:long_description, :food_group_id)

      conditions[]
      arguments[]

      unless search_params[:food_group_id].blank?
				conditions << 'food_group_id = :food_group_id'
				arguments[:food_group_id] = "#{search_params[:food_group_id]}"	
      end

      unless search_params[:long_description].blank?
				conditions << 'lower(long_description) LIKE :long_description'
				arguments[:long_description] = "%#{search_params[:long_description].downcase}%"	
      end

      all_conditions = conditions.join(' AND ')

      if search_params[:nutrient_id].blank?
      	@foods = Food.find(:all, :conditions => [all_conditions, arguments], :limit => search_params[:limit], :offset => search_params[:offset])
      else
      	@foods = Food.find_by_sql \
    								["select * from foods where food_id in (select food_id from food_nutrients where food_nutrients.nutrient_id = :nutrient_id) where food.food_group_id = :food_group_id ORDER BY long_description DESC LIMIT :offset,:limit", { :nutrient_id => search_params[:nutrient_id], :food_group_id => search_params[:food_group_id], :offset => search_params[:offset], :limit => search_params[:limit]}]
      end

		else
    	@foods = Food.all
    end

	end

	def show
		@food = Food.find(params[:id])
	end

end

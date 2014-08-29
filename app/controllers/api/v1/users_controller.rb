class Api::V1::UsersController < Api::V1::ApplicationController

  def index

	if params[:search]
      search_params = params[:search].permit(:type, :name, :phone, :city)

      conditions[]
      arguments[]

      unless search_params[:type].blank?
        conditions << 'type = :type'
        arguments[:type] = "#{search_params[:type]}" 
      end

      unless search_params[:name].blank?
        conditions << 'lower(name) LIKE :name'
        arguments[:name] = "%#{search_params[:name].downcase}%" 
      end

      unless search_params[:phone].blank?
        conditions << 'phone = :phone'
        arguments[:phone] = "#{search_params[:phone]}" 
      end

      unless search_params[:city].blank?
        conditions << 'lower(city) LIKE :city'
        arguments[:city] = "%#{search_params[:city].downcase}" 
      end

      all_conditions = conditions.join(' AND ')

      @users = User.find(:all, :conditions => [all_conditions, arguments])
    else
      @users = User.all
    end

  end

  def show
    @user = User.find(params[:id])
  end

end

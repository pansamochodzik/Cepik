module CarHelper
  def country_name(car)
    if car.country.present?
       car.country.name
    else
      'Please complete data'
    end
  end

  def background_colour(car)
    if car.country.present?
      'bg-warning'
    else
      'bg-danger'
    end
  end
end

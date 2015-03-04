class Playground < ActiveRecord::Base

  SPORTS = ['Football','Cricket','Field Hockey','Tennis','Volleyball','Table Tennis','Baseball','Golf','American Football']

  acts_as_gmappable :process_geocoding => false
  
  validates_inclusion_of :sport, :in => Playground::SPORTS
  validates_presence_of :name

  # *** Server-side reverse geocoding, not for this example!
  #reverse_geocoded_by :latitude, :longitude do |obj,results|
  #  if geo = results.first
  #    obj.city    = geo.city
  #    obj.postal_code = geo.postal_code
  #    obj.country = geo.country_code
  #    obj.route = geo.address
  #  end
  #end
    
  #after_validation :reverse_geocode  

  #def address=(address)
  #end
    
end

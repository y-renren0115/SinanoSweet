class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  has_many :order_details
  
  attachment :image
  
  def revert_status
    if self.is_active == true
      return "販売中"
    else
      return "販売中止"
    end
  end
  
  def revert_genre(item_id)
    genre = Genre.find_by(id: item_id.genre_id)
    genre_name = genre.name
    return genre_name
  end
   
  def self.search(search)
    if search
      where(['name LIKE ?', "%#{search}%"]) 
    end
  end
end

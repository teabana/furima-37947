class Destination < ApplicationRecord

  belongs_to :prefecture
  belongs_to :purchaseorder
  
end

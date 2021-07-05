class ShippingDate < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },  { id: 2, name: '１〜２で発送' },  { id: 3, name: '２〜３で発送' },  { id: 4, name: '４〜７で発送' }
  ]

  include ActiveHash::Associations
  has_many :items
end
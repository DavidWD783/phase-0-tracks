house = {}

rooms = ["Living room", "bedroom", "kitchen", "bathroom"]

def add_room_to_house(house, room)
  house[room] = []
end

rooms.each do |each_room|
  add_room_to_house(house, each_room)
end

p house
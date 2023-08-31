def solution(s)
  photos = s.split("\n").map do |line|
    name, city, datetime = line.split(", ")
    extension = name.split(".").last
    {
      name: name,
      city: city,
      datetime: datetime,
      extension: extension
    }
  end

  city_photos = photos.group_by { |photo| photo[:city] }

  city_photos.each do |city, photos|
    photos.sort_by! { |photo| photo[:datetime] }
    max_number_digits = photos.size.to_s.length

    photos.each_with_index do |photo, index|
      number = (index + 1).to_s.rjust(max_number_digits, '0')
      photo[:new_name] = "#{city}#{number}.#{photo[:extension]}"
    end
  end

  photos.map { |photo| photo[:new_name] }.join("\n")
end

# Given Example input string in the document
input = "photo.jpg, Krakow, 2013-09-05 14:08:15
Mike.png, London, 2015-06-20 15:13:22
myFriends.png, Krakow, 2013-09-05 14:07:13
Eiffel.jpg, Florianopolis, 2015-07-23 08:03:02
pisatower.jpg, Florianopolis, 2015-07-22 23:59:59
BOB.jpg, London, 2015-08-05 00:02:03
notredame.png, Florianopolis, 2015-09-01 12:00:00
me.jpg, Krakow, 2013-09-06 15:40:22
a.png, Krakow, 2016-02-13 13:33:50
b.jpg, Krakow, 2016-01-02 15:12:22
c.jpg, Krakow, 2016-01-02 14:34:30
d.jpg, Krakow, 2016-01-02 15:15:01
e.png, Krakow, 2016-01-02 09:49:09
f.png, Krakow, 2016-01-02 10:55:32
g.jpg, Krakow, 2016-02-29 22:13:11"

# Call the solution function and print the result
puts solution(input)

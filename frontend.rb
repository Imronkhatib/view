require 'unirest'

while true
  puts '[1] To view all Scenery'
  puts '[2] To Create a new Scenery'
  puts '[3] To update a Scenery'
  puts '[4] To delete a Scenery'
  input_selection = gets.chomp.to_i
  if input_selection == 1 
    response = Unirest.get("http://localhost:3000/sceneries")

    p response.body

  elsif input_selection == 2
    puts 'What is the name of some place you would like to create?'
    input_name = gets.chomp
    puts 'Cool! Where is it located?'
    input_location = gets.chomp
    puts 'Wow! Do you have a picture of that?'
    input_image_url = gets.chomp
    response = Unirest.post("http://localhost:3000/sceneries", parameters: 
      {
        name: "#{input_name}",
        location: "#{input_location}",
        image_url: "#{input_image_url}"
      }
    )

    p json: {message: "You just added a scenery!"}

  elsif input_selection == 3
    puts 'Which view are you trying to edit? (input the id)'
    input_id = gets.chomp.to_i
    puts 'What is the new name of the place?'
    input_name = gets.chomp
    puts 'Cool! Where is the new location?'
    input_location = gets.chomp
    puts 'Wow! Do you have a new picture of that?'
    input_image_url = gets.chomp

    response = Unirest.patch("http://localhost:3000/sceneries/#{input_id}", parameters: 
      {
        name: "#{input_name}",
        location: "#{input_location}",
        image_url: "#{input_image_url}"
      } )
    p json: {message: "You just updated #{input_id}"}
  elsif input_selection == 4
    puts 'Which scene are you trying to delete? (input the id)'
    input_id = gets.chomp
    response = Unirest.delete("http://localhost:3000/sceneries/#{input_id}")

    p json: {message:"You just deleted #{input_id}"}
  end
end


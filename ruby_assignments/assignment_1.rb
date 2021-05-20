participant = ['John Doe', '20', 'Male']

participant_hash = {}
sp = participant[0].split
participant_hash[:first_name] = sp[0]
participant_hash[:last_name] = sp[0]
participant_hash[:age] = participant[1].to_i
participant_hash[:gender] = participant[2]


puts "Dear Mr/Ms #{participant[0]}, \n Thanks for your participation in this clinical trial. Below are your captured details, \n First Name: #{participant_hash[:first_name]} \n Last Name: #{participant_hash[:last_name]} \n Age: #{participant_hash[:age]} \n Gender: #{participant_hash[:gender]}  "
json.results @users do |user|
  json.extract! user, :id, :email, :username
end
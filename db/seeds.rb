# user
i = 0;
while i < 50 do
  email = "test@test#{i}"
  name = "test#{i}"
  password = "password"
  User.create(
    email: email,
    name: name,
    password: password
    )
  i += 1
end

# post
user = User.all[0]
i = 0;
while i < 50 do
  content = "seedContent_#{i}"
  user.posts.create(content: content)
  i += 1
end

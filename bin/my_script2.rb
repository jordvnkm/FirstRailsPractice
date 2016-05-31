require 'addressable/uri'
require 'rest-client'

def index_contacts
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/contacts',

  ).to_s

  puts RestClient.get(url)

end

def show_contact
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/contacts/2',

  ).to_s

  puts RestClient.get(url)


end

def create_contact
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/contacts'
  ).to_s

  puts RestClient.post(
    url,
    { contact: { name: "Gizmo", email: "gizmo@gizmo.gizmo", user_id: 2 } }
    )
end

def update_contact
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/contacts/2'
  ).to_s

  puts RestClient.patch(
  url,{contact: {email: "johnnyboy"}}
  )
end

def destroy_contact
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/contacts/3'
  ).to_s

  puts RestClient.delete(
  url
  )
end
# index_contacts
# show_contact
# create_contact
# update_contact
destroy_contact

#
# def create_user
#   url = Addressable::URI.new(
#     scheme: 'http',
#     host: 'localhost',
#     port: 3000,
#     path: '/users.json'
#   ).to_s
#
#   puts RestClient.post(
#     url,
#     { user: { name: "Gizmo", email: "gizmo@gizmo.gizmo" } }
#   )
# end
#
# def destroy_user
#   url = Addressable::URI.new(
#     scheme: 'http',
#     host: 'localhost',
#     port: 3000,
#     path: '/users/5'
#   ).to_s
#
#   puts RestClient.delete(
#   url#,
#   #  { id: 1}
#   )
# end
#
# def update_user
#   url = Addressable::URI.new(
#     scheme: 'http',
#     host: 'localhost',
#     port: 3000,
#     path: '/users/1'
#   ).to_s
#
#   puts RestClient.patch(
#   url,{user: {username: "timmy"}}
#   )
# end

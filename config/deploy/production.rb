set :stage, :production

user = "rails_study"
ipaddress = "52.69.212.13"
role :app, ["#{user}@#{ipaddress}"]
role :web, ["#{user}@#{ipaddress}"]
role :db,  ["#{user}@#{ipaddress}"]

# role :app, %w{rails_study@52.69.252.160}
# role :web, %w{rails_study@52.69.252.160}
# role :db,  %w{rails_study@52.69.252.160}

server '52.69.212.13', user: 'rails_study', roles: %w{web app db}
# user: 'rails_study',
# roles: %w{web app db},

set :ssh_options, {
    keys: %w(/Users/xu.zhiqiang/.ssh/rails_study_key_rsa),
    forward_agent: true,
    user: 'rails_study'
}


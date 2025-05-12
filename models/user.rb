class User
  class << self
    def users
      @users ||= [{ username: 'zece', password: '1234' }]
    end

    def create(username, password)
      raise 'User already exists' if users.any? { |user| user[:username] == username }

      users << { username: username, password: password }
    end

    def registered?(username, password)
      users.any? { |user| user[:username] == username && user[:password] == password }
    end
  end
end

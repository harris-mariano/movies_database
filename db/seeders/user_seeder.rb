# frozen_string_literal: true

User.destroy_all
User.create(
  [
    {
      first_name: 'Test',
      last_name: 'User',
      email: 'test@user.com',
      password: 'password',
      admin: false
    },
    {
      first_name: 'Admin',
      last_name: 'User',
      email: 'admin@user.com',
      password: 'password',
      admin: true
    }
  ]
)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
ApplicationRecord.transaction do
  ##########################
  # ユーザー
  ##########################
  p '=== AdminUser ==='

  admin_user = AdminUser.find_or_initialize_by(name: 'テスト管理者', email: ENV.fetch('DEMO_USER_EMAIL', 'test@test.com'))
  admin_user.password = 'password'
  admin_user.skip_confirmation!
  admin_user.save!
end

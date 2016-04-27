class User < ActiveRecord::Base
  has_secure_password
  def admin?
    self.role == 'admin'
  end
  def mod?
    self.role == 'mod'
  end
  def editor?
    self.role == 'editor'
  end
end

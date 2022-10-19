class SignupSerializer < ActiveModel::Serializer
  attributes :id, :signup_activity

  def signup_activity
    object.activity
  end
end

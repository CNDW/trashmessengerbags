require 'spec_helper'

describe User do
  before(:all) do
    spec_user = User.create
    spec_user.name = "spec"
    spec_user.password = "specpass"
  end
  
  
end

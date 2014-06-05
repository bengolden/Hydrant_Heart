describe Vote do
  context "validations:" do
    it "its type of vote should be specified" do
      should validate_presence_of(:voteable_type)
    end

    it "its value should be a boolean." do
      should ensure_inclusion_of(:value).in_array([true, false])
    end
  end

end
require "spec_helper"

describe Optionable do

  class Model
    include Optionable

    # option(:read).allows(:primary, :secondary)

    def initialize(options = {})
      validate_strict(options)
    end
  end

  describe "#validate_strict" do

    context "when options are empty" do

      it "does not raise an error" do
        expect {
          Model.new
        }.to_not raise_error
      end
    end

    context "when options are nil" do

      it "does not raise an error" do
        expect {
          Model.new(nil)
        }.to_not raise_error
      end
    end

    context "when the options are valid" do

      context "when options are allowed specific values" do

        it "does not raise an error for any value" do
          expect {
            Model.new(read: :primary)
            Model.new(read: :secondary)
          }.to_not raise_error
        end
      end
    end
  end
end

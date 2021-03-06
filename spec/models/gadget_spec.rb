require 'spec_helper'

describe Gadget do
  it { should validate_presence_of :name }

  it { should belong_to :user }
  it { should have_many :pictures }
end

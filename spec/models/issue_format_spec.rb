require 'spec_helper'

module IssueFormatSpecHelper
  def valid_role_attributes
    {
      :title => "Single Issue"
    }
  end
end


describe IssueFormat do
  include IssueFormatSpecHelper

  before(:each) do
    @issue_format = IssueFormat.new
    @issue_format2 = IssueFormat.new( {:title => "Trade Paperback"} )
  end

  it "should require a title" do
    @issue_format.should_not be_valid
  end

  it "should be valid with a title" do
    @issue_format2.should be_valid
  end

end    

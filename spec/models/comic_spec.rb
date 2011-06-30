require 'spec_helper'

module ComicSpecHelper
  def valid_role_attributes
    {
      :title => "Batman"
    }
  end
end


describe Comic do
  include ComicSpecHelper

  before(:each) do
    @comic = Comic.new
    @comic2 = Comic.new( {:title => "Zatanna"} )
  end

  it "should require a title" do
    @comic.should_not be_valid
  end
  
  it "should be valid with a title" do
    @comic2.should be_valid
  end  

end

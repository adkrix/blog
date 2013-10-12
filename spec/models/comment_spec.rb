require 'spec_helper'

describe Comment do
  it { should belong_to :post }

  it { should validate_presence_of :body }

  it { should have_db_column(:body).of_type(:text) }
  it { should have_db_column(:post_id).of_type(:integer) }
end
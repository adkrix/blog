require 'spec_helper'

describe Post do
  it { should have_many :comments }

  it { should validate_presence_of :title }
  it { should validate_presence_of :body }

  it { should have_db_column(:title).of_type(:string) }
  it { should have_db_column(:body).of_type(:text) }
end
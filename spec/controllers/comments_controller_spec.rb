require 'spec_helper'

describe CommentsController do
  describe 'create' do
    before do
      @post = Post.create(title: 'a', body: 'b')
      expect(Comment.count).to eq 0
    end

    it 'creates comment' do
      post :create, { comment: { post_id: @post.id, body: 'hello world' } }

      expect(Comment.count).to eq 1
      comment = Comment.first
      expect(comment.body).to eq 'hello world'
      expect(comment.post_id).to eq @post.id
    end
  end
end
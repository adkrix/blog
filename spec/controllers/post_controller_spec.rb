require 'spec_helper'

describe PostsController do
  describe 'create' do
    before do
      expect(Post.count).to eq 0
    end

    it 'creates post' do
      post :create, { post: { title: 'First post', body: 'hello world' } }

      expect(Post.all.count).to eq 1
      post = Post.first
      expect(post.title).to eq 'First post'
      expect(post.body).to eq 'hello world'
    end
  end

  describe 'update' do
    before do
      @post = Post.create(title: '1', body: '2')
    end

    it 'updates post' do
      put :update, id: @post.id, post: { title: '3', body: '4' }

      @post.reload
      expect(@post.title).to eq '3'
      expect(@post.body).to eq '4'
    end
  end

end